{ pkgs, lib, ... }:
let
  bemenuCommand = "bemenu-run --fn 'Berkeley Mono Medium SemiCondensed 12' --tb '#000000' --tf '#a8ff60' --fb '#000000' --ff '#fdfbee' --nb '#000000' --nf '#fdfbee' --hb '#96cbfe' --hf '#000000' --sb '#96cbfe' --sf '#000000' --scb '#6c6c66' --scf '#fdfbee' -B 5 --bdr '#000000'";
  wallpaperPath = ../../pictures/renoir-seascape-1879.jpg;
in
{
  wayland.windowManager.sway = {
    enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = bemenuCommand;

      fonts = {
        names = [ "Berkeley Mono Medium SemiCondensed" ];
        size = 11.0;
      };

      gaps = {
        inner = 10;
      };

      window = {
        border = 2;
        titlebar = false;
      };

      colors = {
        focused = {
          background = "#8ba4b0";
          border = "#8ba4b0";
          childBorder = "#8ba4b0";
          indicator = "#8ba4b0";
          text = "#090E13";
        };
        unfocused = {
          background = "#090E13";
          border = "#090E13";
          childBorder = "#22262D";
          indicator = "#090E13";
          text = "#C5C9C7";
        };
        focusedInactive = {
          background = "#090E13";
          border = "#090E13";
          childBorder = "#22262D";
          indicator = "#090E13";
          text = "#F8F8F8";
        };
        urgent = {
          background = "#f53fa1";
          border = "#f53fa1";
          childBorder = "#f53fa1";
          indicator = "#f53fa1";
          text = "#F8F8F8";
        };
        placeholder = {
          background = "#090E13";
          border = "#090E13";
          childBorder = "#090E13";
          indicator = "#F8F8F8";
          text = "#F8F8F8";
        };
      };

      seat = {
        "*" = {
          xcursor_theme = "Adwaita 16";
        };
      };

      startup = [
        {
          command = "systemctl --user import-environment PATH WAYLAND_DISPLAY XDG_CURRENT_DESKTOP";
        }
        {
          command = "hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd PATH WAYLAND_DISPLAY XDG_CURRENT_DESKTOP";
        }
        {
          command = "gsettings set org.gnome.desktop.interface cursor-theme Adwaita";
        }
        {
          command = "gsettings set org.gnome.desktop.interface cursor-size 16";
        }
        {
          command = ''
            swaybg --image ${wallpaperPath} --mode fill
          '';
        }
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
          # Terminal
          "${modifier}+Return" = "exec alacritty";

          # Kill window
          "${modifier}+Shift+q" = "kill";

          # Launcher
          "${modifier}+d" = "exec ${bemenuCommand}";

          # Reload config
          "${modifier}+Shift+c" = "reload";

          # Exit sway
          "${modifier}+Shift+e" =
            "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

          # Focus movement (vim keys)
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";

          # Move windows (vim keys)
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";

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

          # Move to workspaces
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
          "${modifier}+e" = "layout toggle split";
          "${modifier}+f" = "fullscreen";

          # Floating
          "${modifier}+Shift+space" = "floating toggle";
          "${modifier}+space" = "focus mode_toggle";
          "${modifier}+a" = "focus parent";

          # Scratchpad
          "${modifier}+Shift+minus" = "move scratchpad";
          "${modifier}+minus" = "scratchpad show";

          # Resize mode
          "${modifier}+r" = "mode resize";

          # Media keys
          "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";

          # Brightness keys
          "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
          "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";

          # Screenshot
          "Print" = "exec grim -t png";
        };

      modes = {
        resize = {
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
      };

      bars = [
        {
          command = "${pkgs.waybar}/bin/waybar";
          position = "top";
        }
      ];

      floating = {
        modifier = "Mod4";
      };
    };

    extraOptions = [ "--unsupported-gpu" ];

    extraConfig = ''
      workspace 1
    '';
  };

  home.packages = with pkgs; [
    bemenu
    brightnessctl
    pavucontrol
    grim
    slurp
    swaybg
    swayidle
    swaylock
    wl-clipboard
    glib
  ];
}
