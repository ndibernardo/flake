{ ... }:
{
  programs.ghostty = {
    enable = false;
    enableZshIntegration = true;
    settings = {
      adjust-cell-height = "20%";
      cursor-style-blink = "false";
      # font-family = "Berkeley Mono";
      # font-style = "Book SemiCondensed";
      font-size = "10";
      theme = "Tomorrow Night";
    };
  };
}
