{
  flake.nixosModules.tools-tmux =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.tools.tmux;
    in
    {
      options.tools.tmux.enable = lib.mkEnableOption "tmux";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        # The NixOS programs.tmux module writes an opinionated /etc/tmux.conf.
        # Installing the plugins on their own instead leaves tmux.conf the only
        # thing configuring tmux; pathsToLink gives the plugins a stable
        # /run/current-system/sw path for run-shell to source.
        environment.systemPackages = with pkgs; [
          tmux
          tmuxPlugins.yank
          tmuxPlugins.tmux-fzf
        ];
        environment.pathsToLink = [ "/share/tmux-plugins" ];

        core.dotfiles.directories = [ ".config/tmux" ];
        core.dotfiles.links.".config/tmux/tmux.conf" = lib.mkDefault "tmux/tmux.conf";
      };
    };
}
