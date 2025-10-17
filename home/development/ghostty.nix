{ ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      adjust-cell-height = "20%";
      cursor-style-blink = "false";
      font-family = "Berkeley Mono";
      font-style = "Book SemiCondensed";
      font-size = "12";
      theme = "Gruvbox Dark Hard";
    };
  };
}
