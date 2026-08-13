{
  flake.nixosModules.core-gnupg =
    { config, lib, ... }:
    let
      cfg = config.core.gnupg;
    in
    {
      options.core.gnupg.enable = lib.mkEnableOption "GnuPG";

      config = lib.mkIf cfg.enable {
        programs.gnupg.agent.enable = true;
      };
    };
}
