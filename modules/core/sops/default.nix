{
  flake.nixosModules.core-sops =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.core.sops;
    in
    {
      options.core.sops = {
        enable = lib.mkEnableOption "sops-nix secret decryption";

        secretsFile = lib.mkOption {
          type = lib.types.path;
          example = lib.literalExpression "./secrets.yaml";
          description = ''
            SOPS-encrypted YAML file holding this host's secrets.

            Must be git-tracked: flake evaluation sees only the git tree, so an
            untracked file is invisible and trips the assertion below.

            Encrypted file is safe to commit; the age private keys that decrypt
            it are not, and never appear in this repository.
          '';
        };
      };

      config = lib.mkIf cfg.enable {
        assertions = [
          {
            assertion = builtins.pathExists cfg.secretsFile;
            message = ''
              core.sops.secretsFile does not exist or is untracked by git.
              Create it with `sops <file>`, then `git add` it.
            '';
          }
        ];

        sops = {
          defaultSopsFile = cfg.secretsFile;
          defaultSopsFormat = "yaml";

          # Host ed25519 SSH key, converted to age at activation. Already on the
          # machine, never leaves it: nothing extra to provision or back up.
          age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

          # Age only. Unused rsa/gnupg fallback would be a second decryption path.
          gnupg.sshKeyPaths = [ ];
        };

        environment.systemPackages = with pkgs; [
          age
          sops
          ssh-to-age
        ];
      };
    };
}
