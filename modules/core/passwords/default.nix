{
  flake.nixosModules.core-passwords =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.core.passwords;
    in
    {
      options.core.passwords.enable = lib.mkEnableOption "1Password";

      config = lib.mkIf cfg.enable {
        environment.sessionVariables.SSH_AUTH_SOCK = "${config.user.homeDirectory}/.1password/agent.sock";

        # The git configuration is a plain file now, so it names the signing
        # helper at /run/current-system/sw/share/1password/op-ssh-sign.
        environment.pathsToLink = [ "/share/1password" ];

        programs._1password.enable = true;
        programs._1password-gui = {
          enable = true;
          polkitPolicyOwners = [ config.user.name ];
        };

        systemd.user.services.onepassword = {
          description = "1Password desktop app";
          after = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          partOf = [ "graphical-session.target" ];
          unitConfig.ConditionUser = config.user.name;
          serviceConfig = {
            ExecStart = "${lib.getExe pkgs._1password-gui} --silent";
            Restart = "on-failure";
            RestartSec = 2;
          };
        };

        security.polkit = {
          enable = true;
          extraConfig = ''
            polkit.addRule(function(action, subject) {
              if (action.id === "com.1password.1Password.authorizeSshAgent" &&
                  subject.user === "${config.user.name}" &&
                  subject.local && subject.active) {
                return polkit.Result.YES;
              }
            });
          '';
        };

        core.nixpkgs.unfreePackages = [
          "1password"
          "1password-cli"
        ];
      };
    };
}
