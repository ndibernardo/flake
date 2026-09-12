{
  machines.daedalus = {
    system = "x86_64-linux";
    config =
      { ... }:
      {
        profiles.workstation.enable = true;
        applications.mpd.musicDirectory = "/run/media/nil/64603C01603BD88E/Music";
        user = {
          name = "nil";
          fullName = "ndibernardo";
          email = "nicola.dibernardo@icloud.com";
          sshKeys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHicoJtvVVNRhgCG84M4qfT7NT1vRCyKOBfQl/Imd9jY"
          ];
        };
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
