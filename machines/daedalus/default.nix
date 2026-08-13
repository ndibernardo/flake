{
  machines.daedalus = {
    system = "x86_64-linux";
    config =
      { ... }:
      {
        profiles.workstation.enable = true;

        core = {
          bluetooth.enable = true;
          nvidia.enable = true;
          openrgb.enable = true;
        };
      };
    nixosModules = [
      ./hardware.nix
    ];
  };
}
