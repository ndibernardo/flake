{
  flake.nixosModules.core-diagnostics =
    { config, lib, ... }:
    let
      cfg = config.core.diagnostics;
    in
    {
      options.core.diagnostics.enable = lib.mkEnableOption "network and performance diagnostics";

      config = lib.mkIf cfg.enable {
        programs.mtr.enable = true;
        services.sysstat.enable = true;
      };
    };
}
