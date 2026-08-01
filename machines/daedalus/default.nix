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

        outputs = [
          {
            monitor = "ASUSTek COMPUTER INC XG32UCWMG T7LMQS087987";
            mode = "3840x2160@240.016Hz";
            position = "0,0";
          }
        ];

        user = {
          name = "nil";
          fullName = "ndibernardo";
          email = "nicola.dibernardo@icloud.com";
          stateVersion = "25.11";
          sshKeys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHicoJtvVVNRhgCG84M4qfT7NT1vRCyKOBfQl/Imd9jY"
          ];
        };
      };
    nixosModules = [
      ./hardware.nix
      ./networking.nix
    ];
  };
}
