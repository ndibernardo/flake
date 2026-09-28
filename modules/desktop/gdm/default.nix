{
  flake.nixosModules.desktop-gdm =
    {
      config,
      lib,
      ...
    }:
    let
      cfg = config.desktop.gdm;
    in
    {
      options.desktop.gdm.enable = lib.mkEnableOption "GDM display manager";

      config = lib.mkIf cfg.enable {
        core.fonts.enable = true;

        services.displayManager.gdm = {
          enable = true;
          autoSuspend = false;
        };
      };
    };
}
