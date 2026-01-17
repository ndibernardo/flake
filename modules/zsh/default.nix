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
    };
    initContent = ''
      bindkey '^R' history-incremental-search-backward
    '';
  };
}
