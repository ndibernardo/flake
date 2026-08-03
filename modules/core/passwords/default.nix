{
  flake.nixosModules.core-passwords =
    { config, lib, ... }:
    let
      cfg = config.core.passwords;
    in
    {
      options.core.passwords.enable = lib.mkEnableOption "1Password";

      config = lib.mkIf cfg.enable {
        programs._1password.enable = true;
        programs._1password-gui = {
          enable = true;
          polkitPolicyOwners = [ config.user.name ];
        };

        core.nixpkgs.unfreePackages = [
          "1password"
          "1password-cli"
        ];
      };
    };
}
