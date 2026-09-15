{ inputs, config, ... }:
let
  flakeConfig = config;
in
{
  flake.overlays.default = final: _: {
    berkeley-mono = final.callPackage ../packages/berkeley-mono.nix { };
    helium = final.callPackage ../packages/helium.nix { };
  };

  perSystem =
    { pkgs, system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfreePredicate =
          pkg:
          builtins.elem (inputs.nixpkgs.lib.getName pkg) [
            "26091623PWV3QQ0R.zip"
            "berkeley-mono"
          ];
        overlays = [ flakeConfig.flake.overlays.default ];
      };

      packages.berkeley-mono = pkgs.berkeley-mono;
    };
}
