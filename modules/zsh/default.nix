{ ... }:
{
  flake.nixosModules.zsh = (
    { user, ... }:
    {
      programs.zsh.enable = true;

      home-manager.users.${user.name}.programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        shellAliases = {
          ll = "ls -la";
        };
        initContent = ''
          PROMPT='%F{blue}%n@%m %~ %(!.#.$)%f '
          bindkey '^R' history-incremental-search-backward
        '';
      };
    }
  );
}
