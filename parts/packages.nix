{ config, ... }:
{
  flake.overlays.default = final: prev: {
    berkeley-mono = final.callPackage ../packages/berkeley-mono.nix { };
    helium = final.callPackage ../packages/helium.nix { };

    emacsPackagesFor =
      emacs:
      (prev.emacsPackagesFor emacs).overrideScope (
        efinal: _: {
          hel-paredit = efinal.callPackage ../packages/hel-paredit.nix { };
          hel-vterm = efinal.callPackage ../packages/hel-vterm.nix { };
        }
      );
  };

  perSystem =
    { pkgs, ... }:
    let
      overlaid = pkgs.extend config.flake.overlays.default;
    in
    {
      packages = {
        inherit (overlaid) helium;
        inherit (overlaid.emacsPackages) hel-paredit hel-vterm;
      };
    };
}
