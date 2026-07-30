{ config, ... }:
let
  flakeConfig = config;
in
{
  flake.nixosModules.core-nixpkgs =
    { config, lib, ... }:
    let
      cfg = config.core.nixpkgs;
    in
    {
      options.core.nixpkgs = {
        enable = lib.mkEnableOption "nixpkgs overlay and unfree packages";

        unfreePackages = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          example = [ "vscode" ];
          description = ''
            Unfree packages this machine accepts, named as `lib.getName`
            returns them. Modules append what they need, so the unfree set
            stays an explicit list rather than a blanket allowUnfree.
          '';
        };
      };

      config = lib.mkIf cfg.enable {
        nixpkgs = {
          config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) cfg.unfreePackages;
          overlays = [ flakeConfig.flake.overlays.default ];
        };
      };
    };
}
