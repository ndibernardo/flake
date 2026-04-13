{ ... }:
{
  flake.nixosModules.nixpkgs = (
    { ... }:
    {
      nixpkgs = {
        config.allowUnfree = true;
        overlays = [
          (final: prev: {
            berkeley-mono = final.callPackage ../../packages/berkeley-mono.nix { };
            solaar = prev.solaar.overrideAttrs (_: {
              version = "unstable-2025-04-13";
              src = final.fetchFromGitHub {
                owner = "pwr-Solaar";
                repo = "Solaar";
                rev = "5478224cfa11730ee6c26437985be431879646b7";
                hash = "sha256-VFLuRzbriuWmhbm4n4NNboVTZ6Y6njmImNtq/Phu1Z0=";
              };
            });
          })
        ];
      };
    }
  );
}
