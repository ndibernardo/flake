{ ... }:
{
  flake.nixosModules.gtk = (
    { pkgs, user, ... }:
    {
      home-manager.users.${user.name} = {
        dconf = {
          enable = true;
          settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
        };

        gtk = {
          enable = true;
          cursorTheme = {
            name = "Adwaita";
            size = 16;
          };
          iconTheme = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
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

        home.sessionVariables.GTK_THEME = "Adwaita-dark";
      };
    }
  );
}
