{ ... }:
{
  flake.nixosModules.gtk = (
    { pkgs, user, ... }:
    {
      home-manager.users.${user.name} = {
        dconf = {
          enable = true;
        };

        gtk = {
          cursorTheme = {
            name = "Adwaita";
            size = 16;
          };
          enable = true;
          gtk3.extraConfig.gtk-application-prefer-dark-theme = 0;
          gtk4 = {
            extraConfig.gtk-application-prefer-dark-theme = 0;
            theme = null;
          };
          theme = {
            name = "Adwaita";
            package = pkgs.gnome-themes-extra;
          };
        };
      };
    }
  );
}
