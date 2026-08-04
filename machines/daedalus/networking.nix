{
  config,
  lib,
  pkgs,
  ...
}:
let
  # NAT external interface and both kill switches reference this. Bound once so
  # a rename cannot disable two leak guards while the config still evaluates.
  iface = "wg-mullvad";

  # wg-quick derives the interface name from the config file's basename.
  tunnelConf = "${iface}.conf";

  # Requires core.sops.enable in ./default.nix; asserted below.
  mullvad = true;
  exitNode = true;

  # Drop forwarded tailnet traffic not leaving via the tunnel, so exit-node
  # clients cannot egress over the bare ISP link if the tunnel drops.
  exitKillSwitch = true;

  # Same for this host's own traffic. Off by default: a mistake here leaves the
  # machine with no network and no way to build a fix.
  hostKillSwitch = false;

  mullvad-relay = pkgs.writeShellApplication {
    name = "mullvad-relay";
    runtimeInputs = with pkgs; [
      curl
      jq
      wireguard-tools
    ];
    text = ''
      api=https://api.mullvad.net/www/relays/wireguard/
      iface=${iface}

      case "''${1-status}" in
        list)
          curl -sf "$api" | jq -r --arg c "''${2-}" '
            .[] | select($c == "" or .country_code == $c)
               | "\(.hostname)\t\(.country_name)\t\(.city_name)"' | sort
          ;;

        switch)
          [ -n "''${2-}" ] || { echo "usage: mullvad-relay switch <hostname> [port]" >&2; exit 1; }
          port=''${3-51820}
          relay=$(curl -sf "$api" | jq -e --arg h "$2" '.[] | select(.hostname == $h)')
          pub=$(jq -r .public_key    <<<"$relay")
          addr=$(jq -r .ipv4_addr_in <<<"$relay")
          old=$(wg show "$iface" peers)

          # allowed-ips is a routing table: assigning 0.0.0.0/0 to the new peer
          # takes it from the old one, so the cutover is atomic.
          wg set "$iface" peer "$pub" \
            endpoint "$addr:$port" \
            allowed-ips 0.0.0.0/0,::/0 \
            persistent-keepalive 25

          # remove every stale peer: an interrupted switch can leave more than
          # one behind
          for p in $old; do
            [ "$p" = "$pub" ] || wg set "$iface" peer "$p" remove
          done
          echo "switched to $2 ($addr:$port)"
          ;;

        status)
          wg show "$iface"
          curl -sf https://am.i.mullvad.net/json \
            | jq '{ip, mullvad_exit_ip, mullvad_exit_ip_hostname}'
          ;;

        *)
          echo "usage: mullvad-relay {list [country-code]|switch <hostname>|status}" >&2
          exit 1
          ;;
      esac
    '';
  };
in
{
  config = lib.mkMerge [
    {
      assertions = [
        {
          assertion = mullvad -> config.core.sops.enable;
          message = "daedalus: the Mullvad tunnel is rendered from encrypted secrets, so core.sops must be enabled.";
        }
        {
          assertion = exitNode -> mullvad;
          message = "daedalus: the exit node has no upstream unless the Mullvad tunnel is enabled.";
        }
      ];

      networking = {
        firewall.enable = true;
        nftables.enable = true;
        useDHCP = lib.mkDefault true;

        networkmanager = {
          enable = true;
          wifi.macAddress = "stable";

          # Both interfaces are configured elsewhere; NetworkManager must not
          # activate them or attach DNS to them.
          unmanaged = [
            "tailscale0"
            iface
          ];
        };
      };

      services.tailscale.enable = true;
      networking.firewall.trustedInterfaces = [ "tailscale0" ];
    }

    (lib.mkIf mullvad {
      # None of these reach the Nix store. Relay endpoint and peer key are
      # public, but together they identify which relay this host uses, so they
      # live with the private key rather than in git.
      sops.secrets = {
        "mullvad/private_key" = { };
        "mullvad/address" = { };
        "mullvad/endpoint" = { };
        "mullvad/peer_public_key" = { };
      };

      sops.templates.${tunnelConf} = {
        mode = "0400";
        restartUnits = [ "wg-quick-${iface}.service" ];

        # Table unset, i.e. wg-quick's default "auto": the default route lands
        # in table 51820 behind a low-priority ip rule, so tailscaled's marked
        # packets still resolve via the main table instead of looping back in.
        content = ''
          [Interface]
          PrivateKey = ${config.sops.placeholder."mullvad/private_key"}
          Address = ${config.sops.placeholder."mullvad/address"}

          [Peer]
          PublicKey = ${config.sops.placeholder."mullvad/peer_public_key"}
          Endpoint = ${config.sops.placeholder."mullvad/endpoint"}
          AllowedIPs = 0.0.0.0/0, ::/0
          PersistentKeepalive = 25
        '';
      };

      networking.wg-quick.interfaces.${iface}.configFile = config.sops.templates.${tunnelConf}.path;

      environment.systemPackages = [ mullvad-relay ];

      # Not wg-quick's DNS directive: it rewrites /etc/resolv.conf globally and
      # fights services.resolved.
      services.resolved = {
        enable = true;
        settings.Resolve = {
          DNSOverTLS = "yes";
          FallbackDNS = [ ];
        };
      };
      networking.nameservers = [ "194.242.2.2#dns.mullvad.net" ];

      # Otherwise NetworkManager pushes the ISP's DHCP resolvers into resolved
      # as per-link DNS on the uplink, and per-link servers on the default-route
      # link shadow the global Mullvad pin for generic lookups. mkForce because
      # the resolved module claims this option at the same priority.
      networking.networkmanager.dns = lib.mkForce "none";
    })

    (lib.mkIf (mullvad && hostKillSwitch) {
      networking.nftables.tables.mullvad-host-killswitch = {
        family = "inet";
        content = ''
          chain output {
            type filter hook output priority filter + 10; policy accept;

            oifname {
              "lo",
              "${iface}",
              "tailscale0"
            } accept

            # tailscaled's own sockets, so the tailnet survives an outage
            meta mark and 0x00ff0000 == 0x00080000 accept

            # The tunnel's encrypted packets. wg-quick marks its socket with the
            # routing-table number, 51820 under Table = auto. Mark, not
            # udp dport: scoped to the WireGuard socket, and relay ports other
            # than 51820 keep working.
            meta mark 51820 accept

            # LAN, DHCP, multicast/mDNS discovery
            ip daddr {
              10.0.0.0/8,
              172.16.0.0/12,
              192.168.0.0/16,
              169.254.0.0/16,
              224.0.0.0/4
            } accept
            ip6 daddr { fe80::/10, ff00::/8 } accept
            udp dport { 67, 68, 547 } accept

            counter drop
          }
        '';
      };
    })

    (lib.mkIf exitNode {
      # Also flips net.ipv4.conf.all.forwarding at mkOverride 97, beating the
      # plain 0 from core.hardening. Verify with `sysctl`, not by reading either
      # file.
      services.tailscale.useRoutingFeatures = "server";

      # Redundant with tailscaled's own SNAT, but an explicit rule survives
      # nftables reloads that flush tailscale's runtime chains.
      networking.nat = {
        enable = true;
        # Mullvad assigns an IPv6 address and AllowedIPs includes ::/0, so
        # exit-node clients route IPv6 through the tunnel too. Without v6
        # masquerade, that traffic is SNAT'd only by tailscaled's runtime
        # chains, which an nftables reload flushes.
        enableIPv6 = true;
        externalInterface = iface;
        internalInterfaces = [ "tailscale0" ];
      };
    })

    (lib.mkIf (exitNode && exitKillSwitch) {
      networking.nftables.tables.mullvad-exit-killswitch = {
        family = "inet";
        content = ''
          chain forward {
            type filter hook forward priority filter + 10; policy accept;

            iifname "tailscale0" oifname {
              "tailscale0",
              "${iface}"
            } accept

            iifname "tailscale0" counter drop
          }
        '';
      };
    })
  ];
}
