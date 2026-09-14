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
      configurationDir = ../../../configuration/labwc;

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
        light = configurationDir + "/theme-light.conf";
        dark = configurationDir + "/theme-dark.conf";
      };

      buttons = import ./_buttons.nix { inherit pkgs lib; };
      menuFile = pkgs.writeText "labwc-menu.xml" ((import ./_menu.nix { inherit lib; }) cfg.menu.entries);

      windowRulesXml =
        if cfg.windowRules == [ ] then
          "<windowRules/>"
        else
          lib.concatStringsSep "\n" (
            [ "<windowRules>" ]
            ++ map (
              rule:
              "    <windowRule"
              + lib.concatStrings (lib.mapAttrsToList (name: value: " ${name}=\"${lib.escapeXML value}\"") rule)
              + " />"
            ) cfg.windowRules
            ++ [ "  </windowRules>" ]
          );

      rcFile = pkgs.writeText "labwc-rc.xml" (
        lib.replaceStrings [ "<windowRules/>" ] [ windowRulesXml ] (
          builtins.readFile (configurationDir + "/rc.xml")
        )
      );

      inherit
        (import ./_scripts.nix {
          inherit
            pkgs
            user
            stateDir
            wallpaperArgs
            files
            buttons
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
                  description = "Menu group; sections are sorted and separated by a divider.";
                };

                order = lib.mkOption {
                  type = lib.types.int;
                  default = 100;
                  description = "Position within the section, with ties broken by label.";
                };
              };
            }
          );
          default = [ ];
          description = "Entries in the labwc root menu.";
        };

        windowRules = lib.mkOption {
          type = lib.types.listOf (lib.types.attrsOf lib.types.str);
          default = [ ];
          example = lib.literalExpression ''
            [
              {
                identifier = "spotify";
                ignoreFocusRequest = "yes";
              }
            ]
          '';
          description = ''
            labwc window rules. Every attribute becomes an attribute of the
            generated <windowRule/> element.
          '';
        };

        wallpaper = lib.mkOption {
          type = lib.types.either lib.types.str lib.types.path;
          default = "#4f5459";
          description = ''
            Desktop background: either a "#rrggbb" colour or an image path,
            with images scaled to fill the output.
          '';
        };
      };

      config = lib.mkIf cfg.enable {
        # Alacritty disables its own decorations, so ask labwc to draw the
        # titlebar and border instead.
        desktop.labwc.windowRules = [
          {
            identifier = "Alacritty";
            serverDecoration = "yes";
          }
        ];

        desktop.labwc.menu.entries = [
          {
            label = "Files";
            icon = "org.xfce.thunar";
            command = "thunar";
            order = 10;
          }
          {
            label = "Terminal";
            icon = "Alacritty";
            command = "alacritty";
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

        core.audio.enable = true;
        core.dotfiles.enable = true;
        core.fonts.enable = true;
        desktop.fuzzel.enable = lib.mkDefault true;

        programs.labwc.enable = true;

        services.kanshi = {
          enable = true;
          systemd.target = "labwc-session.target";
        };

        environment.sessionVariables.NIXOS_OZONE_WL = "1";

        environment.systemPackages = with pkgs; [
          theme-apply
          theme-toggle
          grim
          hypridle
          slurp
          swaybg
          swaylock-effects
          wl-clipboard
          wlopm
        ];

        xdg.portal = {
          enable = true;
          extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
          config.labwc = {
            default = [
              "wlr"
              "gtk"
            ];
            "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
          };
        };

        core.dotfiles.directories = [
          ".config/hypr"
          ".config/kanshi"
          ".config/labwc"
        ];
        core.dotfiles.links = {
          ".config/hypr/hypridle.conf" = lib.mkDefault "labwc/hypridle.conf";
          ".config/kanshi/config" = lib.mkDefault "labwc/kanshi.conf";
          ".config/labwc/autostart" = lib.mkDefault "labwc/autostart";
          ".config/labwc/environment" = lib.mkDefault "labwc/environment";
          ".config/labwc/menu.xml" = lib.mkDefault (toString menuFile);
          ".config/labwc/rc.xml" = lib.mkDefault (toString rcFile);
        };
      };
    };
}
