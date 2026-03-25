{ ... }:
{
  flake.nixosModules.docker = {
    virtualisation.docker = {
      enable = true;
      storageDriver = "overlay2";
      autoPrune.enable = true;
    };
  };
}
