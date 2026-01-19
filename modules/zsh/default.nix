{
  ...
}:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -la";
      zed = "zeditor";
    };
    initContent = ''
      PROMPT='%n@%m %~ %(!.#.$) '
      bindkey '^R' history-incremental-search-backward
    '';
  };
}
