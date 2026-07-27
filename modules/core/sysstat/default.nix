{
  flake.nixosModules.core-sysstat =
    { config, lib, ... }:
    let
      cfg = config.core.sysstat;
    in
    {
      options.core.sysstat.enable = lib.mkEnableOption "sysstat performance monitoring";

      config = lib.mkIf cfg.enable {
        services.sysstat.enable = true;
      };
    };
}
