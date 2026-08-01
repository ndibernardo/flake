{
  flake.nixosModules.desktop-gtk =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.gtk;
      user = config.user;
    in
    {
      options.desktop.gtk.enable = lib.mkEnableOption "GTK and Qt theming";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;

        home-manager.users.${user.name} = {
          dconf.enable = true;
          qt = {
            enable = true;
            platformTheme.name = "gtk3";
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
            theme = null;
            gtk4.theme = null;
          };
          home.packages = [ pkgs.gnome-themes-extra ];
        };
      };
    };
}
