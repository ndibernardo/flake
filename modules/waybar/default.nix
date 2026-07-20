{ ... }:
{
  flake.nixosModules.waybar = (
    { pkgs, user, ... }:
    let
      icon = cp: "<span font_family='Symbols Nerd Font'>${builtins.fromJSON ''"\u${cp}"''}</span>";
      i = {
        wifi = icon "f1eb";
        ethernet = icon "f108";
        warning = icon "f071";
        headphone = icon "f025";
        bluetooth = icon "f293";
        phone = icon "f095";
        mobile = icon "f10b";
        car = icon "f1b9";
        volMute = icon "f026";
        volLow = icon "f027";
        volHigh = icon "f028";
      };
    in
    {
      home-manager.users.${user.name} = {
        home.packages = with pkgs; [ pavucontrol ];

        programs.waybar = {
          enable = true;

          settings.mainBar = {
            layer = "top";
            position = "top";
            height = 32;
            spacing = 4;
            "modules-left" = [
              "sway/workspaces"
              "sway/mode"
            ];
            "modules-center" = [ "sway/window" ];
            "modules-right" = [
              "pulseaudio"
              "network"
              # "custom/mullvad"
              # "custom/tailscale"
              # "cpu"
              # "memory"
              "tray"
              "clock"
            ];
            tray.spacing = 10;
            clock = {
              "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
              "format-alt" = "{:%Y-%m-%d}";
            };
            cpu = {
              format = "{usage}% load";
              tooltip = false;
            };
            memory.format = "{}% mem";
            network = {
              interface = "wlp9s0";
              "format-wifi" = "${i.wifi}";
              "format-ethernet" = "${i.ethernet} {ipaddr}/{cidr}";
              "tooltip-format" = "{ifname} via {gwaddr} ";
              "format-linked" = "${i.ethernet} {ifname} (No IP)";
              "format-disconnected" = "${i.warning} Disconnected";
              "on-click" = "nm-connection-editor";
            };
            pulseaudio = {
              format = "{icon}";
              "format-bluetooth" = "{volume}% {icon} {format_source}";
              "format-bluetooth-muted" = "${i.volMute} {icon} {format_source}";
              "format-muted" = "${i.volMute} {format_source}";
              "format-source" = "{volume}% ";
              "format-source-muted" = "";
              "format-icons" = {
                headphone = i.headphone;
                "hands-free" = i.bluetooth;
                headset = i.headphone;
                phone = i.phone;
                portable = i.mobile;
                car = i.car;
                default = [
                  i.volMute
                  i.volLow
                  i.volHigh
                ];
              };
              "on-click" = "pavucontrol";
            };
            "custom/mullvad" = {
              format = "{}";
              "return-type" = "json";
              interval = 5;
              exec = ''
                status=$(${pkgs.mullvad-vpn}/bin/mullvad status)
                if echo "$status" | grep -q "Connected"; then
                  ip=$(echo "$status" | grep -oP 'IPv4: \K[0-9.]+' || echo "N/A")
                  echo "{\"text\":\"vpn $ip\",\"class\":\"connected\",\"tooltip\":\"Mullvad: Connected\nIP: $ip\"}"
                else
                  echo '{"text":"vpn","class":"disconnected","tooltip":"Mullvad: Disconnected"}'
                fi
              '';
            };
            "custom/tailscale" = {
              format = "{}";
              "return-type" = "json";
              interval = 5;
              exec = ''
                if ${pkgs.tailscale}/bin/tailscale status --json | ${pkgs.jq}/bin/jq -e '.BackendState == "Running"' > /dev/null 2>&1; then
                  ip=$(${pkgs.tailscale}/bin/tailscale ip -4 2>/dev/null || echo "N/A")
                  echo "{\"text\":\"ts $ip\",\"class\":\"connected\",\"tooltip\":\"Tailscale: Connected\nIP: $ip\"}"
                else
                  echo '{"text":"ts","class":"disconnected","tooltip":"Tailscale: Disconnected"}'
                fi
              '';
            };
          };

          style = ''
            @define-color bg #000000;
            @define-color fg #c5c8c6;
            @define-color muted #969896;
            @define-color urgent #cc6666;
            @define-color good #b5bd68;
            @define-color accent #54beaf;

            * {
              border: none;
              border-radius: 0;
              font-family: 'Berkeley Mono', 'Symbols Nerd Font';
              font-stretch: semi-condensed;
              font-weight: 600;
            }

            window#waybar {
              background-color: alpha(@bg, 1.00);
              border-bottom: none;
              color: @fg;
              transition-property: background-color;
              transition-duration: .5s;
            }

            window#waybar.hidden {
              opacity: 0.2;
            }

            .module {
              margin: 0px 0px 0px 20px;
            }

            .modules-left .module:first-child {
              margin-left: 0px;
            }

            #cpu.warning {
              background-color: rgba(0, 0, 0, 0);
            }

            #cpu.critical {
              background-color: rgba(0, 0, 0, 0);
            }

            #workspaces {
              margin: 0px;
            }

            #workspaces button {
              padding: 4px 6px;
              color: @muted;
              border-radius: 0px;
              border: 0px solid @muted;
              box-shadow: none;
              background-color: rgba(0, 0, 0, 0);
            }

            #workspaces button:hover {
              box-shadow: inherit;
              text-shadow: inherit;
              background: transparent;
              color: @fg;
              border: 0px solid @muted;
              box-shadow: none;
            }

            #workspaces button.active {
              color: #ffffff;
              background-color: rgba(0, 0, 0, 0);
              border: 0px solid @muted;
              box-shadow: none;
            }

            #workspaces button.active:hover {
              color: #ffffff;
              background-color: rgba(0, 0, 0, 0);
              border: 0px solid @muted;
              box-shadow: none;
            }

            #workspaces button.visible {
              border: 0px solid @muted;
              box-shadow: none;
            }

            #workspaces button.empty {
              border: 0px solid @muted;
              box-shadow: none;
            }

            #workspaces button.focused,
            #workspaces button.focused:hover {
              color: #1d1f21;
              background-color: #54beaf;
            }

            #workspaces button.urgent {
              color: #1d1f21;
              background-color: #cc6666;
            }

            #tray {
              background-color: rgba(0, 0, 0, 0);
            }

            #tray image {
              margin: 0px 10px 0px 0px;
            }

            #clock {
              margin-right: 4px;
            }

            #custom-mullvad.connected,
            #custom-tailscale.connected {
              color: @good;
            }

            #custom-mullvad.disconnected,
            #custom-tailscale.disconnected {
              color: @muted;
            }
          '';
        };
      };
    }
  );
}
