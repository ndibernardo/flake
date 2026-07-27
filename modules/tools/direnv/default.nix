{
  flake.nixosModules.tools-direnv =
    { config, lib, ... }:
    let
      cfg = config.tools.direnv;
    in
    {
      options.tools.direnv.enable = lib.mkEnableOption "direnv with nix-direnv";

      config = lib.mkIf cfg.enable {
        programs.direnv = {
          enable = true;
          nix-direnv.enable = true;
        };
      };
    };
}
