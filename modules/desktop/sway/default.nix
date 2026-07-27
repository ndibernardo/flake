{
  flake.nixosModules.desktop-sway =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.sway;
      user = config.user;
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
      cycle-focus = pkgs.writers.writePython3Bin "sway-cycle-focus" { } ''
        import subprocess
        import json
        import sys


        def find_ws(node, name):
            if node.get("type") == "workspace" and node.get("name") == name:
                return node
            for child in node.get("nodes", []):
                r = find_ws(child, name)
                if r:
                    return r
            return None


        def leaves(node):
            result = []
            if node.get("pid") and not node.get("nodes"):
                result.append(node["id"])
            for child in node.get("nodes", []) + node.get("floating_nodes", []):
                result.extend(leaves(child))
            return result


        def find_focused(node):
            if node.get("focused"):
                return node["id"]
            for child in node.get("nodes", []) + node.get("floating_nodes", []):
                r = find_focused(child)
                if r is not None:
                    return r
            return None


        direction = sys.argv[1] if len(sys.argv) > 1 else "next"
        tree = json.loads(subprocess.check_output(["swaymsg", "-t", "get_tree"]))
        workspaces = json.loads(
            subprocess.check_output(["swaymsg", "-t", "get_workspaces"])
        )
        ws_name = next(w["name"] for w in workspaces if w["focused"])

        ws = find_ws(tree, ws_name)
        ids = leaves(ws) if ws else []
        cur = find_focused(tree)
        n = len(ids)

        if n > 1:
            pos = ids.index(cur) if cur in ids else 0
            target = ids[(pos + (1 if direction == "next" else -1)) % n]
            subprocess.run(["swaymsg", f"[con_id={target}] focus"])
      '';

      float-toggle = pkgs.writeShellScriptBin "sway-float-toggle" ''
        width=$(swaymsg -t get_tree | ${pkgs.jq}/bin/jq -r '.. | objects | select(.focused == true) | .current_border_width')
        swaymsg floating toggle
        state=$(swaymsg -t get_tree | ${pkgs.jq}/bin/jq -r '.. | objects | select(.focused == true) | .floating')
        case "$state" in
          user_on|auto_on)
            swaymsg border normal "$width"
            ;;
          *)
            swaymsg border pixel "$width"
            ;;
        esac
      '';

    in
    {
      options.desktop.sway.enable = lib.mkEnableOption "sway";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;
        desktop.kanshi.enable = true;

        environment.systemPackages = [
          cycle-focus
          float-toggle
          pkgs.swayidle
          pkgs.swaylock-effects
          pkgs.grim
          pkgs.slurp
          pkgs.networkmanagerapplet
        ];

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
                "tray"
                "clock"
              ];
              tray.spacing = 10;
              clock = {
                "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                "format-alt" = "{:%Y-%m-%d}";
              };
              network = {
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
            };

            style = ''
              @define-color bg #000000;
              @define-color fg #c5c8c6;
              @define-color muted #969896;
              @define-color urgent #cc6666;
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
            '';
          };

          wayland.windowManager.sway = {
            enable = true;
            extraSessionCommands = ''
              export GTK_IM_MODULE=simple
            '';
            systemd = {
              enable = true;
              variables = [ "--all" ];
            };
            config = {
              modifier = "Mod4";
              terminal = "foot";
              menu = "fuzzel";

              fonts = {
                names = [ "Berkeley Mono Medium SemiCondensed" ];
                size = 11.0;
              };

              gaps.inner = 10;

              window = {
                border = 1;
                titlebar = false;
              };

              colors = {
                focused = {
                  background = "#54beaf";
                  border = "#54beaf";
                  childBorder = "#54beaf";
                  indicator = "#8abeb7";
                  text = "#1d1f21";
                };
                unfocused = {
                  background = "#1d1f21";
                  border = "#282a2e";
                  childBorder = "#282a2e";
                  indicator = "#282a2e";
                  text = "#c5c8c6";
                };
                focusedInactive = {
                  background = "#1d1f21";
                  border = "#969896";
                  childBorder = "#969896";
                  indicator = "#969896";
                  text = "#c5c8c6";
                };
                urgent = {
                  background = "#cc6666";
                  border = "#cc6666";
                  childBorder = "#cc6666";
                  indicator = "#cc6666";
                  text = "#1d1f21";
                };
                placeholder = {
                  background = "#1d1f21";
                  border = "#282a2e";
                  childBorder = "#282a2e";
                  indicator = "#c5c8c6";
                  text = "#c5c8c6";
                };
              };

              focus = {
                followMouse = "always";
                mouseWarping = false;
              };

              input."*".scroll_factor = "5";

              input."type:keyboard" = {
                xkb_layout = "us";
                xkb_variant = "intl";
              };

              seat."*".xcursor_theme = "Adwaita 16";

              bars = [ ];

              startup = [
                {
                  command = "waybar";
                }
                { command = "nm-applet"; }
                { command = "solaar --window=hide"; }
                { command = "openrgb --mode static --color 000000"; }
                {
                  command = "systemctl --user import-environment PATH WAYLAND_DISPLAY XDG_CURRENT_DESKTOP";
                }
                {
                  command = "hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd PATH WAYLAND_DISPLAY XDG_CURRENT_DESKTOP";
                }
                { command = "gsettings set org.gnome.desktop.interface cursor-theme Adwaita"; }
                { command = "gsettings set org.gnome.desktop.interface cursor-size 16"; }
                {
                  command = ''
                    swayidle -w \
                      timeout 1800 'swaylock -f -c 000000' \
                      timeout 2400 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
                      before-sleep 'swaylock -f -c 000000'
                  '';
                }
              ];

              keybindings =
                let
                  modifier = "Mod4";
                in
                lib.mkOptionDefault {
                  "${modifier}+Return" = "exec foot";
                  "${modifier}+Tab" = "exec sway-cycle-focus next";
                  "${modifier}+Shift+Tab" = "exec sway-cycle-focus prev";
                  "${modifier}+q" = "kill";
                  "${modifier}+d" = "exec fuzzel";
                  "${modifier}+Shift+c" = "reload";
                  "${modifier}+Shift+e" =
                    "exec swaynag -t warning -m 'Exit sway?' -B 'Yes, exit sway' 'swaymsg exit'";
                  # Focus
                  "${modifier}+h" = "focus left";
                  "${modifier}+j" = "focus down";
                  "${modifier}+k" = "focus up";
                  "${modifier}+l" = "focus right";
                  "${modifier}+Left" = "focus left";
                  "${modifier}+Down" = "focus down";
                  "${modifier}+Up" = "focus up";
                  "${modifier}+Right" = "focus right";
                  # Move
                  "${modifier}+Shift+h" = "move left";
                  "${modifier}+Shift+j" = "move down";
                  "${modifier}+Shift+k" = "move up";
                  "${modifier}+Shift+l" = "move right";
                  "${modifier}+Shift+Left" = "move left";
                  "${modifier}+Shift+Down" = "move down";
                  "${modifier}+Shift+Up" = "move up";
                  "${modifier}+Shift+Right" = "move right";
                  # Workspaces
                  "${modifier}+1" = "workspace number 1";
                  "${modifier}+2" = "workspace number 2";
                  "${modifier}+3" = "workspace number 3";
                  "${modifier}+4" = "workspace number 4";
                  "${modifier}+5" = "workspace number 5";
                  "${modifier}+6" = "workspace number 6";
                  "${modifier}+7" = "workspace number 7";
                  "${modifier}+8" = "workspace number 8";
                  "${modifier}+9" = "workspace number 9";
                  "${modifier}+0" = "workspace number 10";
                  "${modifier}+comma" = "workspace next";
                  "${modifier}+Shift+1" = "move container to workspace number 1";
                  "${modifier}+Shift+2" = "move container to workspace number 2";
                  "${modifier}+Shift+3" = "move container to workspace number 3";
                  "${modifier}+Shift+4" = "move container to workspace number 4";
                  "${modifier}+Shift+5" = "move container to workspace number 5";
                  "${modifier}+Shift+6" = "move container to workspace number 6";
                  "${modifier}+Shift+7" = "move container to workspace number 7";
                  "${modifier}+Shift+8" = "move container to workspace number 8";
                  "${modifier}+Shift+9" = "move container to workspace number 9";
                  "${modifier}+Shift+0" = "move container to workspace number 10";
                  # Layout
                  "${modifier}+b" = "splith";
                  "${modifier}+v" = "splitv";
                  "${modifier}+s" = "layout stacking";
                  "${modifier}+w" = "layout tabbed";
                  "${modifier}+n" = "layout toggle split";
                  "${modifier}+f" = "fullscreen";
                  "${modifier}+Shift+space" = "exec sway-float-toggle";
                  "${modifier}+space" = "focus mode_toggle";
                  "${modifier}+a" = "focus parent";
                  # Scratchpad
                  "${modifier}+Shift+minus" = "move scratchpad";
                  "${modifier}+minus" = "scratchpad show";
                  # Resize mode
                  "${modifier}+r" = "mode resize";
                };

              modes.resize = {
                h = "resize shrink width 10px";
                j = "resize grow height 10px";
                k = "resize shrink height 10px";
                l = "resize grow width 10px";
                Left = "resize shrink width 10px";
                Down = "resize grow height 10px";
                Up = "resize shrink height 10px";
                Right = "resize grow width 10px";
                Return = "mode default";
                Escape = "mode default";
              };

              floating.modifier = "Mod4";
            };

            extraOptions = [ "--unsupported-gpu" ];

            extraConfig = ''
              workspace 1
              title_align left
              output * bg #000000 solid_color

              bindgesture swipe:4:left workspace prev
              bindgesture swipe:4:right workspace next
              bindgesture swipe:3:down focus up
              bindgesture swipe:3:up focus down
              bindgesture swipe:3:left focus right
              bindgesture swipe:3:right focus left

              bindsym --locked XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
              bindsym --locked XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
              bindsym --locked XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
              bindsym --locked XF86AudioMicMute exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
              bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%-
              bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+

              bindsym Print exec ${pkgs.grim}/bin/grim -t png
              bindsym Mod4+Print exec ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" -t png
            '';
          };
        };

        programs.sway = {
          enable = true;
          wrapperFeatures = {
            base = true;
            gtk = true;
          };
        };

        security.pam.services.sway.enableGnomeKeyring = true;
        services.gnome.gnome-keyring.enable = true;

        xdg.portal = {
          wlr.enable = true;
          extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
          config.sway = {
            default = lib.mkForce [
              "wlr"
              "gtk"
            ];
            "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
          };
        };
      };
    };
}
