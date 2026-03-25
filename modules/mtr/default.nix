{ ... }:
{
  flake.nixosModules.mtr = {
    programs.mtr.enable = true;
  };
}
