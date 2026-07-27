{
  flake.nixosModules.core-mtr =
    { config, lib, ... }:
    let
      cfg = config.core.mtr;
    in
    {
      options.core.mtr.enable = lib.mkEnableOption "mtr";

      config = lib.mkIf cfg.enable {
        programs.mtr.enable = true;
      };
    };
}
