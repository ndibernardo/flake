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
      modifier = "Mod4";

      brightnessctl = lib.getExe pkgs.brightnessctl;
      grim = lib.getExe pkgs.grim;
      pactl = lib.getExe' pkgs.pulseaudio "pactl";
      swayidle = lib.getExe pkgs.swayidle;
      swaylock = lib.getExe pkgs.swaylock;
    in
    {
      options.desktop.sway.enable = lib.mkEnableOption "Sway";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;
        desktop.fuzzel.enable = true;
        desktop.waybar.enable = true;
        applications.alacritty.enable = true;

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

        environment.systemPackages = [
          pkgs.brightnessctl
          pkgs.grim
          pkgs.swayidle
          pkgs.swaylock
          pkgs.wl-clipboard
        ];

        home-manager.users.${user.name}.wayland.windowManager.sway = {
          enable = true;
          systemd = {
            enable = true;
            variables = [ "--all" ];
          };

          config = {
            inherit modifier;
            terminal = "alacritty";
            menu = "fuzzel";

            fonts = {
              names = [ "Departure Mono" ];
              size = 12.0;
            };

            input."type:keyboard" = {
              xkb_layout = "us";
              xkb_variant = "intl";
            };

            gaps.inner = 8;

            window = {
              border = 1;
              titlebar = false;
            };

            colors = {
              focused = {
                background = "#16161D";
                border = "#EFEFF4";
                childBorder = "#EFEFF4";
                indicator = "#EFEFF4";
                text = "#EFEFF4";
              };
              unfocused = {
                background = "#16161D";
                border = "#373746";
                childBorder = "#373746";
                indicator = "#373746";
                text = "#9999AA";
              };
              focusedInactive = {
                background = "#1E1E28";
                border = "#555568";
                childBorder = "#555568";
                indicator = "#555568";
                text = "#9999AA";
              };
              urgent = {
                background = "#E31B23";
                border = "#E31B23";
                childBorder = "#E31B23";
                indicator = "#E31B23";
                text = "#EFEFF4";
              };
              placeholder = {
                background = "#16161D";
                border = "#373746";
                childBorder = "#373746";
                indicator = "#9999AA";
                text = "#9999AA";
              };
            };

            seat."*".xcursor_theme = "Adwaita 16";

            startup = [
              { command = "systemctl --user import-environment PATH WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"; }
              {
                command = "hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd PATH WAYLAND_DISPLAY XDG_CURRENT_DESKTOP";
              }
              { command = "gsettings set org.gnome.desktop.interface cursor-theme Adwaita"; }
              { command = "gsettings set org.gnome.desktop.interface cursor-size 16"; }
              {
                command = ''
                  ${swayidle} -w \
                    timeout 1800 '${swaylock} -f -c 16161d' \
                    timeout 2400 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
                    before-sleep '${swaylock} -f -c 16161d'
                '';
              }
            ];

            keybindings = lib.mkOptionDefault {
              "${modifier}+Return" = "exec alacritty";
              "${modifier}+Shift+q" = "kill";
              "${modifier}+d" = "exec fuzzel";
              "${modifier}+Shift+c" = "reload";
              "${modifier}+Shift+e" =
                "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
              "${modifier}+h" = "focus left";
              "${modifier}+j" = "focus down";
              "${modifier}+k" = "focus up";
              "${modifier}+l" = "focus right";
              "${modifier}+Shift+h" = "move left";
              "${modifier}+Shift+j" = "move down";
              "${modifier}+Shift+k" = "move up";
              "${modifier}+Shift+l" = "move right";
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
              "${modifier}+b" = "splith";
              "${modifier}+v" = "splitv";
              "${modifier}+s" = "layout stacking";
              "${modifier}+w" = "layout tabbed";
              "${modifier}+e" = "layout toggle split";
              "${modifier}+f" = "fullscreen";
              "${modifier}+Shift+space" = "floating toggle";
              "${modifier}+space" = "focus mode_toggle";
              "${modifier}+a" = "focus parent";
              "${modifier}+Shift+minus" = "move scratchpad";
              "${modifier}+minus" = "scratchpad show";
              "${modifier}+r" = "mode resize";
              "XF86AudioMute" = "exec ${pactl} set-sink-mute @DEFAULT_SINK@ toggle";
              "XF86AudioLowerVolume" = "exec ${pactl} set-sink-volume @DEFAULT_SINK@ -5%";
              "XF86AudioRaiseVolume" = "exec ${pactl} set-sink-volume @DEFAULT_SINK@ +5%";
              "XF86AudioMicMute" = "exec ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle";
              "XF86MonBrightnessDown" = "exec ${brightnessctl} set 5%-";
              "XF86MonBrightnessUp" = "exec ${brightnessctl} set 5%+";
              "Print" = "exec ${grim} -t png";
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
                command = lib.getExe pkgs.waybar;
                position = "top";
              }
            ];

            floating.modifier = modifier;

            assigns."5" = [ { class = "^steam$"; } ];
          };

          extraOptions = [ "--unsupported-gpu" ];

          extraConfig = ''
            workspace 1
            output * bg #16161D solid_color
          '';
        };
      };
    };
}
