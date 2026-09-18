{ inputs, config, ... }:
let
  flakeConfig = config;
in
{
  flake.overlays.default = final: prev: {
    berkeley-mono = final.callPackage ../packages/berkeley-mono.nix { };

    vimPlugins = prev.vimPlugins.extend (
      _: _: {
        tairiki = final.callPackage ../packages/tairiki.nix { };
      }
    );
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

      packages = {
        berkeley-mono = pkgs.berkeley-mono;
        inherit (pkgs.vimPlugins) tairiki;
      };
    };
}
