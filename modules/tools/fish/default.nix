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
            set -g fish_color_autosuggestion 8a8a8a
            set -g fish_color_param blue
            set -g fish_color_valid_path blue
          '';
          shellAliases = {
            cat = "bat";
            ll = "eza -la --git --group-directories-first";
            ls = "eza --group-directories-first";
            tree = "eza --tree --git-ignore --level=2 --group-directories-first";
          };
          functions.fish_prompt = ''
            set_color normal
            set -l dir (basename $PWD)
            test "$PWD" = "$HOME"; and set dir '~'
            printf '%s $ ' $dir
          '';
        };
      };
    };
}
