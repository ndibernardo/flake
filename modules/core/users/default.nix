{
  flake.nixosModules.core-users =
    { config, lib, ... }:
    let
      cfg = config.core.users;
      user = config.user;
    in
    {
      options.core.users.enable = lib.mkEnableOption "primary user account";

      config = lib.mkIf cfg.enable {
        users.users.${user.name} = {
          description = user.name;
          extraGroups = [
            "audio"
            "bluetooth"
            "docker"
            "networkmanager"
            "video"
            "wheel"
          ];
          isNormalUser = true;
          openssh.authorizedKeys.keys = user.sshKeys;
        };
      };
    };
}
