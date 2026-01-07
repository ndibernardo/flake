{ ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Berkeley Mono:size=9:weight=medium:width=condensed";
        dpi-aware = "yes";
        pad = "5x5";
      };

      scrollback = {
        lines = 10000;
        multiplier = 3.0;
      };

      cursor = {
        style = "block";
      };

      mouse = {
        hide-when-typing = "no";
      };

      colors = {
        alpha = 1.0;

        # Primary colors
        background = "18181B";
        foreground = "dddddd";

        # Normal colors
        regular0 = "000000"; # black
        regular1 = "cf9292"; # red
        regular2 = "73cc98"; # green
        regular3 = "c7ae95"; # yellow
        regular4 = "95aec7"; # blue
        regular5 = "ae95c7"; # magenta
        regular6 = "7bd3c5"; # cyan
        regular7 = "dddddd"; # white

        # Bright colors
        bright0 = "747c84"; # bright black
        bright1 = "cf9292"; # bright red
        bright2 = "73cc98"; # bright green
        bright3 = "c7ae95"; # bright yellow
        bright4 = "95aec7"; # bright blue
        bright5 = "ae95c7"; # bright magenta
        bright6 = "7bd3c5"; # bright cyan
        bright7 = "ffffff"; # bright white

        cursor = "000000 dddddd";
      };

      bell = {
        urgent = "no";
        notify = "no";
        visual = "no";
      };
    };
  };
}
