{ pkgs, lib, ... }:
let
  bemenuCommand = "bemenu-run --fn 'Berkeley Mono Medium SemiCondensed 12' --tb '#141D22' --tf '#A5FBFF' --fb '#141D22' --ff '#A5FBFF' --nb '#141D22' --nf '#A5FBFF' --ab '#141D22' --af '#A5FBFF' --hb '#A5FBFF' --hf '#141D22' --sb '#A5FBFF' --sf '#141D22' --scb '#3a4c4e' --scf '#A5FBFF' -B 5 --bdr '#141D22'";
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
      terminal = "ghostty";
      menu = bemenuCommand;

      fonts = {
        names = [ "Berkeley Mono Medium SemiCondensed" ];
        size = 11.0;
      };

      gaps = {
        inner = 10;
      };

      window = {
        border = 1;
        titlebar = false;
      };

      colors = {
        focused = {
          background = "#141D22";
          border = "#A5FBFF";
          childBorder = "#A5FBFF";
          indicator = "#3df2ad";
          text = "#A5FBFF";
        };
        unfocused = {
          background = "#141D22";
          border = "#1D1C19";
          childBorder = "#1D1C19";
          indicator = "#1D1C19";
          text = "#3a4c4e";
        };
        focusedInactive = {
          background = "#141D22";
          border = "#3a4c4e";
          childBorder = "#3a4c4e";
          indicator = "#3a4c4e";
          text = "#92dde1";
        };
        urgent = {
          background = "#dd513c";
          border = "#dd513c";
          childBorder = "#dd513c";
          indicator = "#dd513c";
          text = "#141D22";
        };
        placeholder = {
          background = "#141D22";
          border = "#1D1C19";
          childBorder = "#1D1C19";
          indicator = "#A5FBFF";
          text = "#A5FBFF";
        };
      };

      input = {
        "*" = {
          xkb_layout = "us";
          xkb_variant = "intl";
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
            swayidle -w \
              timeout 1800 'swaylock -f -c 000000' \
              timeout 2400 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
              before-sleep 'swaylock -f -c 000000'
          '';
        }
        {
          command = "swaybg -c '#141D22'";
        }
      ];

      keybindings =
        let
          modifier = "Mod4";
        in
        lib.mkOptionDefault {
          # Terminal
          "${modifier}+Return" = "exec ghostty";

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

      output = {
        "DP-4" = {
          mode = "3840x2160@240.016Hz";
          position = "0,0";
        };
      };

      assigns = {
        "5" = [ { class = "^steam$"; } ];
        "8" = [
          { app_id = "^puddletag$"; }
        ];
        "9" = [
          { app_id = "^org.nicotine_plus.Nicotine$"; }
        ];
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
