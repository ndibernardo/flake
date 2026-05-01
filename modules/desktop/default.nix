{ ... }:
{
  flake.nixosModules.desktop = (
    { pkgs, user, ... }:
    {
      services.xserver.enable = true;
      services.desktopManager.gnome.enable = true;
      services.displayManager.gdm.enable = true;

      environment.systemPackages =
        (with pkgs.gnomeExtensions; [
          arc-menu
          pop-shell
          tailscale-status
          user-themes
        ])
        ++ (with pkgs; [
          gnome-tweaks
        ]);

      home-manager.users.${user.name} = {
        xdg.configFile."gtk-3.0/settings.ini".force = true;
        xdg.configFile."gtk-4.0/settings.ini".force = true;

        dconf = {
          enable = true;
          settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
          settings."org/gnome/shell".enabled-extensions = [
            "arcmenu@arcmenu.com"
            "pop-shell@system76.com"
            "tailscale-status@maxgallup.github.com"
            "user-theme@gnome-shell-extensions.gcampax.github.com"
          ];
        };

        gtk = {
          enable = true;
          cursorTheme = {
            name = "Adwaita";
            size = 16;
          };
          theme = {
            name = "Adwaita-dark";
            package = pkgs.gnome-themes-extra;
          };
          gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
          gtk4 = {
            extraConfig.gtk-application-prefer-dark-theme = 1;
            theme = null;
          };
        };

        qt = {
          enable = true;
          platformTheme.name = "gtk3";
          style = {
            name = "adwaita";
            package = pkgs.adwaita-qt;
          };
        };
      };
    }
  );
}
