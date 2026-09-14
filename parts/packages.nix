{ inputs, config, ... }:
let
  flakeConfig = config;
in
{
  flake.overlays.default = final: _: {
    helium = final.callPackage ../packages/helium.nix { };
  };

  perSystem =
    { pkgs, system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ flakeConfig.flake.overlays.default ];
      };
    };
}
