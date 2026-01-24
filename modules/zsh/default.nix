{
  ...
}:
{
  home-manager.users.nil.programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -la";
    };
    initContent = ''
      PROMPT='%n@%m %~ %(!.#.$) '
      bindkey '^R' history-incremental-search-backward
    '';
  };
}
