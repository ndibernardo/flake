{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = {
          x = 8;
          y = 8;
        };
        decorations = "full";
        opacity = 1.0;
      };

      font = {
        normal = {
          family = "JetBrainsMono";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono";
          style = "Regular";
        };
        size = 11.0;
      };

      # Kanso Zen theme
      colors = {
        primary = {
          background = "#090E13";
          foreground = "#C5C9C7";
        };

        cursor = {
          text = "#090E13";
          cursor = "#C5C9C7";
        };

        selection = {
          text = "#f2f1ef";
          background = "#393B44";
        };

        normal = {
          black = "#090E13";
          red = "#C34043";
          green = "#98BB6C";
          yellow = "#DCA561";
          blue = "#7FB4CA";
          magenta = "#938AA9";
          cyan = "#8ea4a2";
          white = "#C5C9C7";
        };

        bright = {
          black = "#717C7C";
          red = "#C34043";
          green = "#98BB6C";
          yellow = "#DCA561";
          blue = "#7FB4CA";
          magenta = "#a292a3";
          cyan = "#8ea4a2";
          white = "#f2f1ef";
        };
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "Off";
        };
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      terminal = {
        shell = {
          program = "${pkgs.zsh}/bin/zsh";
        };
      };
    };
  };
}
