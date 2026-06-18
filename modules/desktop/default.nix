{ ... }:
{
  flake.nixosModules.desktop = (
    { pkgs, user, ... }:
    {
      services.xserver.enable = true;
    }
  );
}
