{
  flake.nixosModules.core-home-manager =
    { config, lib, ... }:
    let
      cfg = config.core.home-manager;
      user = config.user;
    in
    {
      options.core.home-manager = {
        enable = lib.mkEnableOption "home-manager integration";

        sessionPath = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ "${user.homeDirectory}/.local/bin" ];
          defaultText = lib.literalExpression ''[ "''${config.user.homeDirectory}/.local/bin" ]'';
          description = "Absolute directories prepended to the user's PATH.";
        };
      };

      config = lib.mkIf cfg.enable {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          users.${user.name} = {
            home = {
              inherit (user) homeDirectory stateVersion;
              username = user.name;
              sessionPath = cfg.sessionPath;
            };

            # Login shells read hm-session-vars.sh, but `systemd --user` never does,
            # so desktop launchers and user units need environment.d as well.
            xdg.configFile."environment.d/10-session-path.conf".text = ''
              PATH=${lib.concatStringsSep ":" cfg.sessionPath}:''${PATH}
            '';

            programs.home-manager.enable = true;
          };
        };
      };
    };
}
