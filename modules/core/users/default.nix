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
            default = "user";
            description = "Primary user's login name.";
          };

          fullName = lib.mkOption {
            type = lib.types.str;
            default = "User";
            description = "Git commit and signing name.";
          };

          email = lib.mkOption {
            type = lib.types.str;
            default = "user@localhost";
            description = "Git commit email.";
          };

          homeDirectory = lib.mkOption {
            type = lib.types.str;
            default = "/home/${config.user.name}";
            defaultText = lib.literalExpression ''"/home/''${config.user.name}"'';
            description = "Primary user's home directory.";
          };

          sshKeys = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ ];
            description = "SSH public keys accepted for this user.";
          };
        };

        core.users.enable = lib.mkEnableOption "primary user account";
      };

      config = lib.mkIf cfg.enable {
        # Replaces home-manager's home.sessionPath; NixOS puts this in the
        # profile script and in environment.d, so `systemd --user` sees it too.
        environment.localBinInPath = true;

        users.users.${user.name} = {
          description = user.name;
          extraGroups = [
            "audio"
            "bluetooth"
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
