{ ... }:
{
  flake.nixosModules.packages = (
    { lib, config, ... }:
    {
      options.machine.packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
      };

      config = {
        nixpkgs = {
          config.allowUnfree = true;
          overlays = [
            (final: _: {
              berkeley-mono = final.callPackage ../../packages/berkeley-mono.nix { };
            })
          ];
        };

        environment.systemPackages = config.machine.packages;
      };
    }
  );
}