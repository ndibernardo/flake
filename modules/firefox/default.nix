{ ... }:
{
  flake.nixosModules.firefox = (
    { user, ... }:
    {
      programs.firefox.enable = true;
    }
  );
}
