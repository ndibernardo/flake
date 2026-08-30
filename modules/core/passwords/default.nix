{
  flake.nixosModules.core-passwords =
    { config, lib, ... }:
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

        security.polkit = {
          enable = true;
          extraConfig = ''
            polkit.addRule(function(action, subject) {
              if (action.id.indexOf("com.1password.1Password.") === 0 &&
                  subject.user === "${config.user.name}") {
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
