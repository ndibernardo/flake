{
  machines.daedalus = {
    system = "x86_64-linux";
    config =
      { ... }:
      {
        profiles.workstation.enable = true;
        applications.mpd.musicDirectory = "/run/media/nil/64603C01603BD88E/Music";
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
