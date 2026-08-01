{
  flake.nixosModules.core-users =
    { config, lib, ... }:
    let
      cfg = config.core.users;
      user = config.user;
    in
    {
      options = {
        user = {
          name = lib.mkOption {
            type = lib.types.str;
            description = "Primary user's login name.";
          };

          fullName = lib.mkOption {
            type = lib.types.str;
            description = "Git commit and signing name.";
          };

          email = lib.mkOption {
            type = lib.types.str;
            description = "Git commit email.";
          };

          homeDirectory = lib.mkOption {
            type = lib.types.str;
            default = "/home/${config.user.name}";
            defaultText = lib.literalExpression ''"/home/''${config.user.name}"'';
            description = "Primary user's home directory.";
          };

          stateVersion = lib.mkOption {
            type = lib.types.str;
            description = "home-manager state version. Do not change on existing systems.";
          };

          sshKeys = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            description = "SSH public keys accepted for this user.";
          };
        };

        core.users.enable = lib.mkEnableOption "primary user account";
      };

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
          uid = 1000;
          openssh.authorizedKeys.keys = user.sshKeys;
        };
      };
    };
}
