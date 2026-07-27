{
  flake.nixosModules.core-ld =
    { config, lib, ... }:
    let
      cfg = config.core.ld;
    in
    {
      options.core.ld.enable = lib.mkEnableOption "nix-ld for unpatched binaries";

      config = lib.mkIf cfg.enable {
        programs.nix-ld.enable = true;
      };
    };
}
