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
          cursorTheme = {
            name = "Adwaita";
            size = 16;
          };
          enable = true;
          gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
          gtk4 = {
            extraConfig.gtk-application-prefer-dark-theme = 1;
            theme = null;
          };
          theme = {
            name = "Adwaita-dark";
            package = pkgs.gnome-themes-extra;
          };
        };
      };
    }
  );
}
