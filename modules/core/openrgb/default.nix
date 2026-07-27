{
  flake.nixosModules.core-openrgb =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.core.openrgb;
    in
    {
      options.core.openrgb.enable = lib.mkEnableOption "OpenRGB lighting control";

      config = lib.mkIf cfg.enable {
        services.hardware.openrgb = {
          enable = true;
          package = pkgs.openrgb;
        };
      };
    };
}
