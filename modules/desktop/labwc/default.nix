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

      wallpaper = "#4f5459";

      files = {
        light = ./configurations/theme-light.conf;
        dark = ./configurations/theme-dark.conf;
      };

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
            wallpaper
            files
            sfwbarCss
            ;
        })
        theme-apply
        theme-toggle
        ;
    in
    {
      options.desktop.labwc.enable = lib.mkEnableOption "labwc";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;
        desktop.kanshi.enable = true;

        programs.labwc.enable = true;

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

            xdg.configFile."labwc/menu.xml".source = ./configurations/menu.xml;

            xdg.configFile."sfwbar/sfwbar.config".source = ./configurations/sfwbar.config;

            xdg.configFile."sfwbar/showdesktop.widget".source = ./configurations/showdesktop.widget;
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
