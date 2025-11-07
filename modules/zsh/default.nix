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
      PROMPT='%F{green}%n@%m%f %F{blue}%~%f %(!.#.$) '
    '';
  };
}
