{ ... }:

{
  programs.ghostty = {
    enable = true;

    themes = {
      nostromo = {
        background = "141D22";
        foreground = "A5FBFF";
        cursor-color = "A5FBFF";
        selection-background = "365878";
        selection-foreground = "9fe1e3";

        palette = [
          "0=#0f1518"
          "1=#dd513c"
          "2=#3df2ad"
          "3=#FFFF84"
          "4=#34A2DF"
          "5=#eb78c3"
          "6=#4DDCFF"
          "7=#91b0b1"
          "8=#3a4c4e"
          "9=#c83434"
          "10=#7fc87f"
          "11=#f2eda1"
          "12=#3bb9ff"
          "13=#db628b"
          "14=#28ccd9"
          "15=#A5FBFF"
        ];
      };
    };

    settings = {
      # Font
      font-family = "Berkeley Mono";
      font-style = "Medium SemiCondensed";
      font-size = 12;

      # Theme
      theme = "nostromo";
      background-opacity = 1.0;

      # Cursor
      cursor-style = "block";

      # Window
      window-padding-x = 5;
      window-padding-y = 5;

      # Scrollback
      scrollback-limit = 10000;

      # Mouse
      mouse-hide-while-typing = false;

      # Bell
      shell-integration-features = "no-cursor,no-sudo,no-title";
    };
  };
}
