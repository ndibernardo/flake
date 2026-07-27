{
  flake.nixosModules.tools-atuin =
    { config, lib, ... }:
    let
      cfg = config.tools.atuin;
      user = config.user;
    in
    {
      options.tools.atuin.enable = lib.mkEnableOption "atuin shell history";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;

        home-manager.users.${user.name}.programs.atuin = {
          enable = true;
          enableFishIntegration = true;
        };
      };
    };
}
