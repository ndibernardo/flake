{
  flake.nixosModules.tools-fish =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.tools.fish;
      user = config.user;
    in
    {
      options.tools.fish.enable = lib.mkEnableOption "fish";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;

        programs.fish.enable = true;

        users.users.${user.name}.shell = pkgs.fish;

        home-manager.users.${user.name}.programs.fish = {
          enable = true;
          interactiveShellInit = ''
            set -g fish_greeting
          '';
          shellAliases = {
            ll = "ls -la";
          };
        };
      };
    };
}
