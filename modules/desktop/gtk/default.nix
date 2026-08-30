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
    in
    {
      options.desktop.gtk.enable = lib.mkEnableOption "GTK and Qt theming";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;
        programs.xfconf.enable = true;
        services.gvfs.enable = true;
        services.udisks2.enable = true;

        qt = {
          enable = true;
          platformTheme = "gtk2";
          style = "gtk2";
        };

        environment.systemPackages = with pkgs; [
          adwaita-icon-theme
          gnome-themes-extra
          thunar-volman
          thunar-archive-plugin
          thunar-media-tags-plugin
          thunar-vcs-plugin
          thunar-shares-plugin
          xarchiver
        ];

        # GTK writes bookmarks and recently-used state into these directories,
        # so only settings.ini is linked. The window-button layout and the
        # Thunar view defaults now live in the dconf and xfconf databases:
        # set once by hand, they persist across rebuilds.
        core.dotfiles.directories = [
          ".config/gtk-3.0"
          ".config/gtk-4.0"
        ];
        core.dotfiles.links = {
          ".config/gtk-3.0/settings.ini" = lib.mkDefault "gtk-3.0/settings.ini";
          ".config/gtk-4.0/settings.ini" = lib.mkDefault "gtk-4.0/settings.ini";
        };
      };
    };
}
