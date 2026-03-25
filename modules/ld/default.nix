{ ... }:
{
  flake.nixosModules.ld = {
    programs.nix-ld.enable = true;
  };
}
