{ ... }:
{
  flake.nixosModules.waybar = (
    {
      pkgs,
      user,
      ...
    }:
    {
      home-manager.users.${user.name} = {
        programs.waybar = {
          enable = true;
          settings = {
            mainBar = {
              layer = "top";
              position = "top";
              height = 32;
              spacing = 4;

              modules-left = [
                "sway/workspaces"
                "sway/mode"
              ];

              modules-center = [
                "sway/window"
              ];

              modules-right = [
                "pulseaudio"
                "network"
                "custom/mullvad"
                "custom/tailscale"
                "cpu"
                "memory"
                "clock"
                "tray"
              ];

              tray.spacing = 10;

              clock = {
                tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                format-alt = "{:%Y-%m-%d}";
              };

              cpu = {
                format = "{usage}% load";
                tooltip = false;
              };

              memory.format = "{}% mem";

              network = {
                interface = "wlp9s0";
                format-wifi = "{essid} ({signalStrength}%) ";
                format-ethernet = "{ipaddr}/{cidr} ";
                tooltip-format = "{ifname} via {gwaddr} ";
                format-linked = "{ifname} (No IP) ";
                format-disconnected = "Disconnected ⚠";
                format-alt = "{ifname}: {ipaddr}/{cidr}";
              };

              pulseaudio = {
                format = "{volume}% {icon}";
                format-bluetooth = "{volume}% {icon} {format_source}";
                format-bluetooth-muted = " {icon} {format_source}";
                format-muted = " {format_source}";
                format-source = "{volume}% ";
                format-source-muted = "";
                format-icons = {
                  headphone = "";
                  hands-free = "";
                  headset = "";
                  phone = "";
                  portable = "";
                  car = "";
                  default = [
                    ""
                    ""
                    ""
                  ];
                };
                on-click = "pavucontrol";
              };

              "custom/mullvad" = {
                format = "{}";
                return-type = "json";
                interval = 5;
                exec = ''
                  status=$(${pkgs.mullvad-vpn}/bin/mullvad status)
                  if echo "$status" | grep -q "Connected"; then
                    ip=$(echo "$status" | grep -oP 'IPv4: \K[0-9.]+' || echo "N/A")
                    echo "{\"text\":\"vpn $ip\",\"class\":\"connected\",\"tooltip\":\"Mullvad: Connected\\nIP: $ip\"}"
                  else
                    echo '{"text":"vpn","class":"disconnected","tooltip":"Mullvad: Disconnected"}'
                  fi
                '';
              };

              "custom/tailscale" = {
                format = "{}";
                return-type = "json";
                interval = 5;
                exec = ''
                  if ${pkgs.tailscale}/bin/tailscale status --json | ${pkgs.jq}/bin/jq -e '.BackendState == "Running"' > /dev/null 2>&1; then
                    ip=$(${pkgs.tailscale}/bin/tailscale ip -4 2>/dev/null || echo "N/A")
                    echo "{\"text\":\"ts $ip\",\"class\":\"connected\",\"tooltip\":\"Tailscale: Connected\\nIP: $ip\"}"
                  else
                    echo '{"text":"ts","class":"disconnected","tooltip":"Tailscale: Disconnected"}'
                  fi
                '';
              };
            };
          };

          style = ''
            * {
              border: none;
              border-radius: 0;
              font-family: 'Berkeley Mono';
              font-stretch: semi-condensed;
              font-weight: 600;
              font-size: 17px;
            }

            window#waybar {
              background-color: #1d1f21;
              border-bottom: none;
              color: #c5c8c6;
              transition-property: background-color;
              transition-duration: .5s;
            }

            window#waybar.hidden {
              opacity: 0.2;
            }

            .module {
              margin: 0px 0px 0px 20px;
            }

            #cpu.warning {
              background-color: rgba(0, 0, 0, 0);
            }

            #cpu.critical {
              background-color: rgba(0, 0, 0, 0);
            }

            #workspaces {
              margin: 0px 0px 0px 0px;
            }

            #workspaces button {
              padding: 4px 6px;
              color: #969896;
              border-radius: 0px;
              border: 0px solid #282a2e;
              box-shadow: none;
              background-color: rgba(0, 0, 0, 0);
            }

            #workspaces button.active {
              border: 0px solid #282a2e;
              box-shadow: none;
            }

            #workspaces button.visible {
              border: 0px solid #282a2e;
              box-shadow: none;
            }

            #workspaces button.empty {
              border: 0px solid #282a2e;
              box-shadow: none;
            }

            #workspaces button:hover {
              box-shadow: inherit;
              text-shadow: inherit;
              background: transparent;
              color: #c5c8c6;
              border: 0px solid #282a2e;
              box-shadow: none;
            }

            #workspaces button.focused {
              color: #1d1f21;
              background-color: #81a2be;
              border: 0px solid #282a2e;
              box-shadow: none;
            }

            #workspaces button.focused:hover {
              color: #1d1f21;
              background-color: #8abeb7;
              border: 0px solid #282a2e;
              box-shadow: none;
            }

            #workspaces button.urgent {
              color: #1d1f21;
              background-color: #cc6666;
              border: 0px solid #282a2e;
              box-shadow: none;
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
              color: #b5bd68;
            }

            #custom-mullvad.disconnected,
            #custom-tailscale.disconnected {
              color: #969896;
            }
          '';
        };

        home.packages = with pkgs; [
          pavucontrol
        ];
      };
    }
  );
}
