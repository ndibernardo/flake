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
      PROMPT='%F{cyan}%n@%m%f %F{white}%~%f %(!.#.$) '
    '';
  };
}
