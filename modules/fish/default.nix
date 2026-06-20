{ ... }:
{
  flake.nixosModules.fish = (
    { pkgs, user, ... }:
    {
      programs.fish.enable = true;

      users.users.${user.name}.shell = pkgs.fish;

      home-manager.users.${user.name}.programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set -g fish_greeting

          # Pragmata palette
          set -g fish_color_user           194E00
          set -g fish_color_host           194E00
          set -g fish_color_host_remote    194E00
          set -g fish_color_cwd            194E00
          set -g fish_color_command        000000 --bold
          set -g fish_color_keyword        000000 --bold
          set -g fish_color_param          000000
          set -g fish_color_option         000000
          set -g fish_color_quote          56283c
          set -g fish_color_comment        194E00
          set -g fish_color_operator       e41507
          set -g fish_color_redirection    e41507
          set -g fish_color_end            e41507
          set -g fish_color_error          e41507 --bold
          set -g fish_color_autosuggestion 606060
          set -g fish_color_match          2981ca --bold
          set -g fish_color_selection      --background=d0d0d0
          set -g fish_color_search_match   --background=ff5000
          set -g fish_color_history_current 2981ca
          set -g fish_color_valid_path
          set -g fish_pager_color_prefix         ff5000 --bold
          set -g fish_pager_color_completion     000000
          set -g fish_pager_color_description    606060
          set -g fish_pager_color_selected_background --background=d0d0d0
        '';
        shellAliases = {
          ll = "ls -la";
        };
      };
    }
  );
}
