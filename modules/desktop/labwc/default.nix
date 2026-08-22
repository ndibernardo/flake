{
  flake.nixosModules.desktop-labwc =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.labwc;
      user = config.user;
      stateDir = "${user.homeDirectory}/.local/state/theme";

      wallpaperArgs = lib.escapeShellArgs (
        if lib.hasPrefix "#" (toString cfg.wallpaper) then
          [
            "-c"
            cfg.wallpaper
          ]
        else
          [
            "-i"
            "${cfg.wallpaper}"
            "-m"
            "fill"
          ]
      );

      files = {
        light = ./configurations/theme-light.conf;
        dark = ./configurations/theme-dark.conf;
      };

      buttons = import ./_buttons.nix { inherit pkgs lib; };

      menu = import ./_menu.nix { inherit lib; };

      sfwbarBg = {
        light = "#ffffff";
        dark = "#1d1f21";
      };

      sfwbarFocusedFg = {
        light = "#1d1d1d";
        dark = "#ffffff";
      };

      sfwbarCss = lib.mapAttrs (
        mode: bg:
        pkgs.writeText "sfwbar-${mode}.css" ''
          window#sfwbar { background-color: ${bg}; }
          .focused, .focused image { color: ${sfwbarFocusedFg.${mode}}; }
          .module:hover, .module:hover image, button#startmenu:hover, button#startmenu:hover image, button#module:hover, button#module:hover image, button#taskbar_item:hover { color: ${sfwbarFocusedFg.${mode}}; }
        ''
      ) sfwbarBg;

      inherit
        (import ./_scripts.nix {
          inherit
            pkgs
            user
            stateDir
            wallpaperArgs
            files
            buttons
            sfwbarCss
            ;
        })
        theme-apply
        theme-toggle
        ;
    in
    {
      options.desktop.labwc = {
        enable = lib.mkEnableOption "labwc";

        menu.entries = lib.mkOption {
          type = lib.types.listOf (
            lib.types.submodule {
              options = {
                label = lib.mkOption {
                  type = lib.types.str;
                  description = "Menu entry label.";
                };

                icon = lib.mkOption {
                  type = lib.types.str;
                  default = "";
                  description = "Icon name, empty for none.";
                };

                command = lib.mkOption {
                  type = lib.types.str;
                  description = "Command executed when the entry is picked.";
                };

                section = lib.mkOption {
                  type = lib.types.int;
                  default = 0;
                  description = ''
                    Group the entry belongs to; sections are rendered in
                    ascending order and separated by a divider.
                  '';
                };

                order = lib.mkOption {
                  type = lib.types.int;
                  default = 100;
                  description = "Position within the section, ties broken by label.";
                };
              };
            }
          );
          default = [ ];
          description = ''
            Application entries shared by the labwc root menu and the sfwbar
            menu. Definitions from several modules are concatenated, so other
            flakes can add entries without redefining the defaults.
          '';
        };

        wallpaper = lib.mkOption {
          type = lib.types.either lib.types.str lib.types.path;
          default = "#4f5459";
          description = ''
            Desktop background: either a "#rrggbb" colour or an image path,
            the latter scaled to fill the output.
          '';
        };
      };

      config = lib.mkIf cfg.enable {
        desktop.labwc.menu.entries = [
          {
            label = "Files";
            icon = "org.xfce.thunar";
            command = "thunar";
            order = 10;
          }
          {
            label = "Terminal";
            icon = "com.mitchellh.ghostty";
            command = "ghostty";
            order = 20;
          }
          {
            label = "Helium";
            icon = "helium";
            command = "helium";
            order = 30;
          }
          {
            label = "Emacs";
            icon = "emacs";
            command = ''emacsclient -c -a ""'';
            order = 40;
          }
          {
            label = "Obsidian";
            icon = "obsidian";
            command = "obsidian";
            order = 50;
          }
          {
            label = "1Password";
            icon = "1password";
            command = "1password";
            order = 60;
          }
          {
            label = "Steam";
            icon = "steam";
            command = "steam";
            order = 70;
          }
          {
            label = "Signal";
            icon = "signal-desktop";
            command = "signal-desktop";
            section = 1;
            order = 10;
          }
          {
            label = "Telegram";
            icon = "org.telegram.desktop";
            command = "Telegram";
            section = 1;
            order = 20;
          }
        ];

        core.home-manager.enable = true;
        desktop.kanshi.enable = true;

        programs.labwc.enable = true;

        security.pam.services.swaylock = { };

        environment.sessionVariables.NIXOS_OZONE_WL = "1";

        environment.systemPackages = [
          theme-apply
          theme-toggle
          pkgs.hypridle
          pkgs.swaylock-effects
          pkgs.wlopm
          pkgs.grim
          pkgs.slurp
          pkgs.swaybg
          pkgs.sfwbar
          pkgs.networkmanagerapplet
        ];

        home-manager.users.${user.name} =
          { lib, ... }:
          {
            systemd.user.targets.labwc-session = {
              Unit = {
                Description = "labwc compositor session";
                Documentation = [ "man:systemd.special(7)" ];
                BindsTo = [ "graphical-session.target" ];
                Wants = [ "graphical-session-pre.target" ];
                After = [ "graphical-session-pre.target" ];
              };
            };

            home.activation.themeSeed = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
              if [ ! -f "${stateDir}/mode" ]; then
                run ${theme-apply}/bin/theme-apply dark
              fi
            '';

            xdg.configFile."labwc/autostart" = {
              executable = true;
              source = ./configurations/autostart;
            };

            xdg.configFile."labwc/environment".source = ./configurations/environment;

            xdg.configFile."hypr/hypridle.conf".source = ./configurations/hypridle.conf;

            xdg.configFile."labwc/rc.xml".source = ./configurations/rc.xml;

            xdg.configFile."labwc/menu.xml".text = menu.labwcMenu cfg.menu.entries;

            xdg.configFile."sfwbar/sfwbar.config".source = ./configurations/sfwbar.config;

            xdg.configFile."sfwbar/showdesktop.widget".source = ./configurations/showdesktop.widget;

            xdg.configFile."sfwbar/root-menu.widget".text = menu.sfwbarMenu cfg.menu.entries;
          };

        xdg.portal.config.labwc = {
          default = lib.mkForce [
            "wlr"
            "gtk"
          ];
          "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
        };
      };
    };
}
