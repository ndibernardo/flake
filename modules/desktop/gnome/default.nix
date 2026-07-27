{
  flake.nixosModules.desktop-gnome =
    { config, lib, ... }:
    let
      cfg = config.desktop.gnome;
    in
    {
      options.desktop.gnome.enable = lib.mkEnableOption "GNOME";

      config = lib.mkIf cfg.enable {
        services.desktopManager.gnome.enable = true;
      };
    };
}
