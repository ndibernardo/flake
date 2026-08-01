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
            monitor = "DP-1";
            mode = "3840x2160@240.016Hz";
            position = "0,0";
          }
        ];

        user = {
          name = "user";
          fullName = "User";
          email = "user@localhost";
          stateVersion = "25.11";
          sshKeys = [
          ];
        };
      };
    nixosModules = [
      ./hardware.nix
    ];
  };
}
