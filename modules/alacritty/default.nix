{ pkgs, ... }:

{
  home-manager.users.nil.programs.alacritty = {
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
          family = "Victor Mono";
          style = "Medium";
        };
        bold = {
          family = "Victor Mono";
          style = "Bold";
        };
        italic = {
          family = "Victor Mono";
          style = "Medium";
        };
        size = 13.0;
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
