{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
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
          "backlight"
          "sway/language"
          "clock"
          "tray"
        ];

        "keyboard-state" = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };

        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };

        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [
            ""
            ""
          ];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };

        mpd = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 5;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        tray = {
          spacing = 10;
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        cpu = {
          format = "{usage}% load";
          tooltip = false;
        };

        memory = {
          format = "{}% mem";
        };

        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };

        backlight = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };

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

        "custom/media" = {
          format = "{icon} {text}";
          return-type = "json";
          max-length = 40;
          format-icons = {
            spotify = "";
            default = "🎜";
          };
          escape = true;
          exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
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
              echo "{\"text\":\"tailscale0 $ip\",\"class\":\"connected\",\"tooltip\":\"Tailscale: Connected\\nIP: $ip\"}"
            else
              echo '{"text":"tailscale0","class":"disconnected","tooltip":"Tailscale: Disconnected"}'
            fi
          '';
        };

        "custom/power" = {
          format = "⏻ ";
          tooltip = false;
          menu = "on-click";
          menu-file = "$HOME/.config/waybar/power_menu.xml";
          menu-actions = {
            shutdown = "shutdown";
            reboot = "reboot";
            suspend = "systemctl suspend";
            hibernate = "systemctl hibernate";
          };
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
        font-size: 16px;
      }

      window#waybar {
        background-color: #141D22;
        border-bottom: none;
        color: #A5FBFF;
        transition-property: background-color;
        transition-duration: .5s;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      label#window {
        text-shadow: 0px 0px 3px #141D22;
        color: #A5FBFF;
      }

      .module {
        margin: 0px 0px 0px 20px;
      }

      #bluetooth {
        min-width: 30px;
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
        padding: 2px 6px;
        color: #3a4c4e;
        border-radius: 0px;
        border: 0px solid #1D1C19;
        box-shadow: none;
        background-color: rgba(20, 29, 34, 0);
      }

      #workspaces button.active {
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #workspaces button.visible {
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #workspaces button.urgent {
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #workspaces button.empty {
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #workspaces button.persistent {
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #workspaces button.hidden {
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #workspaces button.current_output {
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background: transparent;
        color: #A5FBFF;
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #workspaces button.focused {
        color: #141D22;
        background-color: #A5FBFF;
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #workspaces button.focused:hover {
        color: #141D22;
        background-color: #A5FBFF;
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #workspaces button.urgent {
        color: #141D22;
        background-color: #dd513c;
        border: 0px solid #1D1C19;
        box-shadow: none;
      }

      #language {
        color: #A5FBFF;
      }

      #tray {
        background-color: rgba(20, 29, 34, 0);
      }

      #tray image {
        margin: 0px 10px 0px 0px;
      }

      #clock {
        margin-right: 4px;
      }

      #mode {
        background-color: rgba(20, 29, 34, 0);
        border: 2px solid #dd513c;
        margin: 0px 10px 0px 0px;
        border-radius: 5px;
      }

      #custom-mullvad.connected,
      #custom-tailscale.connected {
        color: #3df2ad;
      }

      #custom-mullvad.disconnected,
      #custom-tailscale.disconnected {
        color: #3a4c4e;
      }
    '';
  };

  home.packages = with pkgs; [
    pavucontrol
  ];
}
