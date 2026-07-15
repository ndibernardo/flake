{ pkgs, user }:
let
  icon = cp: builtins.fromJSON ''"\u${cp}"'';
  icons = {
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
  mkWaybar =
    {
      left,
      center ? [ ],
      right,
    }:
    {
      settings = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 4;
        "modules-left" = left;
        "modules-center" = center;
        "modules-right" = right;
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
        "ext/workspaces" = {
          format = "{name}";
          "sort-by-number" = true;
          "on-click" = "activate";
        };
        "wlr/taskbar" = {
          format = "{icon} {title}";
          "icon-size" = 16;
          "on-click" = "activate";
          "on-click-right" = "close";
          tooltip = true;
          rewrite = {
            "^(.{30}).+$" = "$1…";
          };
        };
        network = {
          interface = "wlp9s0";
          "format-wifi" = "${icons.wifi}";
          "format-ethernet" = "${icons.ethernet} {ipaddr}/{cidr}";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "${icons.ethernet} {ifname} (No IP)";
          "format-disconnected" = "${icons.warning} Disconnected";
          "on-click" = "nm-connection-editor";
        };
        pulseaudio = {
          format = "{icon}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = "${icons.volMute} {icon} {format_source}";
          "format-muted" = "${icons.volMute} {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            headphone = icons.headphone;
            "hands-free" = icons.bluetooth;
            headset = icons.headphone;
            phone = icons.phone;
            portable = icons.mobile;
            car = icons.car;
            default = [
              icons.volMute
              icons.volLow
              icons.volHigh
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
        @import url("${user.homeDirectory}/.local/state/theme/waybar-colors.css");

        * {
          border: none;
          border-radius: 0;
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

        #workspaces button.focused {
          color: #ffffff;
          background-color: rgba(0, 0, 0, 0);
          border: 0px solid @muted;
          box-shadow: none;
        }

        #workspaces button.focused:hover {
          color: #ffffff;
          background-color: rgba(0, 0, 0, 0);
          border: 0px solid @muted;
          box-shadow: none;
        }

        #workspaces button.urgent {
          color: @urgent;
          background-color: rgba(0, 0, 0, 0);
          border: 0px solid @muted;
          box-shadow: none;
        }

        #taskbar {
          margin: 0px;
        }

        #taskbar button {
          padding: 4px 10px;
          margin: 0px;
          color: @muted;
          border-radius: 0px;
          border: 0px solid @muted;
          border-right: 1px solid alpha(@muted, 0.3);
          box-shadow: none;
          background-color: rgba(0, 0, 0, 0);
        }

        #taskbar button:last-child,
        #taskbar button:last-child:hover {
          border-right: 0px solid @muted;
        }

        #taskbar button image {
          margin-right: 6px;
        }

        #taskbar button:hover {
          box-shadow: inherit;
          text-shadow: inherit;
          background: transparent;
          color: @fg;
          border: 0px solid @muted;
          border-right: 1px solid alpha(@muted, 0.3);
          box-shadow: none;
        }

        #taskbar button.active {
          color: #ffffff;
          background-color: alpha(@accent, 0.25);
          border-right: 1px solid alpha(@muted, 0.3);
          border-bottom: 2px solid @accent;
          box-shadow: none;
        }

        #taskbar button.active:hover {
          color: #ffffff;
          background-color: alpha(@accent, 0.35);
          border-right: 1px solid alpha(@muted, 0.3);
          border-bottom: 2px solid @accent;
          box-shadow: none;
        }

        #taskbar button:last-child.active,
        #taskbar button:last-child.active:hover {
          border-right: 0px solid @muted;
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
}
