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
        programs.xfconf.enable = true;
        services.gvfs.enable = true;
        services.udisks2.enable = true;

        home-manager.users.${user.name} = {
          dconf = {
            enable = true;
            settings."org/gnome/desktop/wm/preferences".button-layout = "appmenu:minimize,maximize,close";
          };
          xfconf.settings.thunar = {
            "last-window-width" = 1500;
            "last-window-height" = 1500;
            "last-show-hidden" = true;
            "last-side-pane-width" = 250;
            "default-view" = "ThunarDetailsView";
            "last-view" = "ThunarDetailsView";
          };
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
            gtk3.extraConfig.gtk-decoration-layout = "appmenu:minimize,maximize,close";
            gtk4.extraConfig.gtk-decoration-layout = "appmenu:minimize,maximize,close";
            gtk4.theme = null;
          };
          home.packages = with pkgs; [
            gnome-themes-extra
            thunar-volman
            thunar-archive-plugin
            thunar-media-tags-plugin
            thunar-vcs-plugin
            thunar-shares-plugin
            xarchiver
          ];
        };
      };
    };
}
