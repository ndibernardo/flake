{
  flake.nixosModules.desktop-gdm =
    { config, lib, ... }:
    let
      cfg = config.desktop.gdm;
    in
    {
      options.desktop.gdm.enable = lib.mkEnableOption "GDM";

      config = lib.mkIf cfg.enable {
        services.displayManager.gdm.enable = true;
      };
    };
}
