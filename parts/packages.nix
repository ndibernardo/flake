{ config, ... }:
{
  flake.overlays.default = final: prev: {
    berkeley-mono = final.callPackage ../packages/berkeley-mono.nix { };
    helium = final.callPackage ../packages/helium.nix { };
  };

  perSystem =
    { pkgs, ... }:
    let
      overlaid = pkgs.extend config.flake.overlays.default;
    in
    {
      packages = {
        inherit (overlaid) helium;
      };
    };
}
