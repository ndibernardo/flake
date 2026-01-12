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
        background = "090E13";
        foreground = "C5C9C7";

        # Normal colors
        regular0 = "090E13"; # black
        regular1 = "CA675F"; # red
        regular2 = "7F9F6E"; # green
        regular3 = "CAAC7A"; # yellow
        regular4 = "7EAABA"; # blue
        regular5 = "A08AA2"; # magenta
        regular6 = "C5C9C7"; # cyan
        regular7 = "A4A7A4"; # white

        # Bright colors
        bright0 = "909398"; # bright black
        bright1 = "ED5965"; # bright red
        bright2 = "7CAF7C"; # bright green
        bright3 = "EDC272"; # bright yellow
        bright4 = "6EBBD4"; # bright blue
        bright5 = "8A88B0"; # bright magenta
        bright6 = "6BAE97"; # bright cyan
        bright7 = "C5C9C7"; # bright white

        cursor = "090E13 C5C9C7";
      };

      bell = {
        urgent = "no";
        notify = "no";
        visual = "no";
      };
    };
  };
}
