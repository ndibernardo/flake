{ ... }:
{
  flake.nixosModules.sway = (
    {
      pkgs,
      lib,
      user,
      ...
    }:
    let
      statusbar = pkgs.writeShellScript "sway-status" ''
        echo '{"version":1}'
        echo '['
        echo '[],'
        while true; do
          USER=$(${pkgs.coreutils}/bin/id -un)
          MEM=$(${pkgs.procps}/bin/free | ${pkgs.gawk}/bin/awk '/^Mem:/{printf "%.0f%%", $3/$2*100}')
          TIME=$(${pkgs.coreutils}/bin/date +'%e %b %Y %H:%M')
          TEXT="<b>User</b> $USER   <b>Mem</b> $MEM   <b>Time</b> $TIME"
          echo "[{\"full_text\":\"$TEXT\",\"markup\":\"pango\"}],"
          ${pkgs.coreutils}/bin/sleep 5
        done
      '';

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
        swaymsg floating toggle
        state=$(swaymsg -t get_tree | ${pkgs.jq}/bin/jq -r '.. | objects | select(.focused == true) | .floating')
        case "$state" in
          user_on|auto_on)
            swaymsg border normal 3
            ;;
          *)
            swaymsg border pixel 3
            ;;
        esac
      '';
    in
    {
      environment.systemPackages = [
        cycle-focus
        float-toggle
      ];

      home-manager.users.${user.name}.wayland.windowManager.sway = {
        enable = true;
        systemd = {
          enable = true;
          variables = [ "--all" ];
        };
        config = {
          modifier = "Mod4";
          terminal = "footclient";
          menu = "bemenu-toggle";

          fonts = {
            names = [ "Iosevka Aile" ];
            size = 11.0;
          };

          gaps.inner = 10;

          window = {
            border = 5;
            titlebar = false;
          };

          focus = {
            followMouse = "always";
            mouseWarping = "container";
          };

          input."*".scroll_factor = "5";

          colors = {
            focused = {
              border = "#000000";
              background = "#000000";
              text = "#EEEEEE";
              indicator = "#000000";
              childBorder = "#000000";
            };
            focusedInactive = {
              border = "#888888";
              background = "#888888";
              text = "#EEEEEE";
              indicator = "#888888";
              childBorder = "#888888";
            };
            unfocused = {
              border = "#888888";
              background = "#888888";
              text = "#EEEEEE";
              indicator = "#888888";
              childBorder = "#888888";
            };
            urgent = {
              border = "#C34043";
              background = "#C34043";
              text = "#EEEEEE";
              indicator = "#C34043";
              childBorder = "#C34043";
            };
            placeholder = {
              border = "#272727";
              background = "#272727";
              text = "#EEEEEE";
              indicator = "#272727";
              childBorder = "#272727";
            };
          };

          seat."*".xcursor_theme = "Adwaita 16";

          startup = [
            { command = "foot --server"; }
            { command = "openrgb --profile white"; }
            { command = "systemctl --user import-environment PATH WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"; }
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
              "${modifier}+Return" = "exec footclient";
              "${modifier}+Tab" = "exec sway-cycle-focus next";
              "${modifier}+Shift+Tab" = "exec sway-cycle-focus prev";
              "${modifier}+q" = "kill";
              "${modifier}+d" = "exec bemenu-toggle";
              "${modifier}+Shift+c" = "reload";
              "${modifier}+Shift+e" =
                "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
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

          bars = [
            {
              position = "top";
              mode = "dock";
              statusCommand = "${statusbar}";
              fonts = {
                names = [ "Iosevka Aile" ];
                size = 11.0;
              };
              colors = {
                statusline = "#000000";
                background = "#F7F7F7";
                separator = "#BBBBBB";
                inactiveWorkspace = {
                  border = "#F7F7F7";
                  background = "#F7F7F7";
                  text = "#777777";
                };
                focusedWorkspace = {
                  border = "#000000";
                  background = "#000000";
                  text = "#F7F7F7";
                };
                urgentWorkspace = {
                  border = "#AA3731";
                  background = "#AA3731";
                  text = "#F7F7F7";
                };
              };
              extraConfig = ''
                strip_workspace_numbers yes
                height 28
                gaps 8 600
                status_edge_padding 12
                status_padding 4
                workspace_min_width 32
              '';
            }
          ];

          floating.modifier = "Mod4";

          output."DP-4" = {
            mode = "3840x2160@240.016Hz";
            position = "0,0";
          };

          assigns = {
            "5" = [ { class = "^steam$"; } ];
            "8" = [ { app_id = "^puddletag$"; } ];
            "9" = [ { app_id = "^org.nicotine_plus.Nicotine$"; } ];
          };
        };

        extraOptions = [ "--unsupported-gpu" ];

        extraConfig = ''
          workspace 1
          output * bg #767676 solid_color
          title_align left

          # Gesture navigation
          bindgesture swipe:4:left workspace prev
          bindgesture swipe:4:right workspace next
          bindgesture swipe:3:down focus up
          bindgesture swipe:3:up focus down
          bindgesture swipe:3:left focus right
          bindgesture swipe:3:right focus left

          # Media keys (--locked so they work on the lock screen)
          bindsym --locked XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
          bindsym --locked XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
          bindsym --locked XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
          bindsym --locked XF86AudioMicMute exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
          bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%-
          bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+

          # Uncomment to make all windows float by default
          # for_window [app_id=".*"] floating enable
          # for_window [class=".*"] floating enable

          # Titlebar only for floating windows
          for_window [tiling] border pixel 3
          for_window [floating] border normal 3

          # Screenshots
          bindsym Print exec ${pkgs.grim}/bin/grim -t png
          bindsym Mod4+Print exec ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" -t png
        '';
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
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
        wlr.enable = true;
      };
    }
  );
}
