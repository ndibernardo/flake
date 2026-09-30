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
      options.desktop.gtk.enable = lib.mkEnableOption "GTK theming";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        environment.systemPackages = with pkgs; [
          adwaita-icon-theme
          gnome-themes-extra
        ];

        core.dotfiles.directories = [
          ".config/gtk-3.0"
          ".config/gtk-4.0"
        ];
        core.dotfiles.links = {
          ".config/gtk-3.0/gtk.css" = lib.mkDefault "gtk-3.0/gtk.css";
          ".config/gtk-3.0/settings.ini" = lib.mkDefault "gtk-3.0/settings.ini";
          ".config/gtk-4.0/gtk.css" = lib.mkDefault "gtk-4.0/gtk.css";
          ".config/gtk-4.0/settings.ini" = lib.mkDefault "gtk-4.0/settings.ini";
        };
      };
    };
}
