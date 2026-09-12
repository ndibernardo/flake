{ inputs, config, ... }:
let
  flakeConfig = config;
in
{
  flake.overlays.default = final: prev: {
    berkeley-mono = final.callPackage ../packages/berkeley-mono.nix { };
    pragmata-pro = final.callPackage ../packages/pragmata-pro.nix { };

    # nixpkgs is still on 1.1.19; this pulls 1.1.20 forward. Drop the
    # override once nixpkgs catches up.
    solaar = prev.solaar.overrideAttrs (_: {
      version = "1.1.20";
      src = final.fetchFromGitHub {
        owner = "pwr-Solaar";
        repo = "Solaar";
        tag = "1.1.20";
        hash = "sha256-h/uiy0TtMicKch2cdXHur5DkvQun2sAw2HpFI7Qstqg=";
      };
    });
  };

  perSystem =
    { pkgs, system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfreePredicate =
          pkg:
          builtins.elem (inputs.nixpkgs.lib.getName pkg) [
            "berkeley-mono"
            "pragmata-pro"
          ];
        overlays = [ flakeConfig.flake.overlays.default ];
      };

      packages = {
        inherit (pkgs)
          berkeley-mono
          pragmata-pro
          ;
      };
    };
}
