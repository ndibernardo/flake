{ ... }:
{
  flake.nixosModules.nixpkgs = (
    { ... }:
    {
      nixpkgs = {
        config.allowUnfree = true;
        overlays = [
          (final: _: {
            berkeley-mono = final.callPackage ../../packages/berkeley-mono.nix { };
          })
        ];
      };
    }
  );
}
