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
        core.dotfiles.enable = true;

        programs.fish.enable = true;

        users.users.${user.name}.shell = pkgs.fish;

        # fish writes fish_variables next to its configuration, so the directory
        # stays real and only the files it does not own are linked.
        core.dotfiles.directories = [ ".config/fish" ];
        core.dotfiles.links = {
          ".config/fish/config.fish" = lib.mkDefault "fish/config.fish";
          ".config/fish/functions" = lib.mkDefault "fish/functions";
        };
      };
    };
}
