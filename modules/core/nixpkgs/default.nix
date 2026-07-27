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
      options.core.nixpkgs.enable = lib.mkEnableOption "nixpkgs overlay and unfree packages";

      config = lib.mkIf cfg.enable {
        nixpkgs = {
          config.allowUnfree = true;
          overlays = [ flakeConfig.flake.overlays.default ];
        };
      };
    };
}
