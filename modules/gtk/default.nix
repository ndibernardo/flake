{ ... }:
{
  flake.nixosModules.gtk = (
    { pkgs, user, ... }:
    {
      home-manager.users.${user.name} = {
        dconf.enable = true;
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
          theme = null;
          gtk4.theme = null;
        };
        home.packages = [ pkgs.gnome-themes-extra ];
      };
    }
  );
}
