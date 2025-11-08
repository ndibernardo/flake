{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      colors = {
        primary = {
          background = "0x000000";
          foreground = "0xfdfbee";
        };

        cursor = {
          text = "0x000000";
          cursor = "0xb5b3aa";
        };

        normal = {
          black = "0x000000";
          red = "0xff6c60";
          green = "0xa8ff60";
          yellow = "0xffffb6";
          blue = "0x96cbfe";
          magenta = "0xff73fd";
          cyan = "0xc6c5fe";
          white = "0xb5b3aa";
        };

        bright = {
          black = "0x6c6c66";
          red = "0xe9c062";
          green = "0x242422";
          yellow = "0x484844";
          blue = "0x918f88";
          magenta = "0xd9d7cc";
          cyan = "0xb18a3d";
          white = "0xfdfbee";
        };
      };

      window = {
        dimensions = {
          columns = 0;
          lines = 0;
        };
        padding = {
          x = 5;
          y = 5;
        };
        dynamic_padding = false;
        decorations = "full";
        opacity = 1.0;
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = {
        normal = {
          family = "Berkeley Mono";
          style = "Retina SemiCondensed";
        };
        bold = {
          family = "Berkeley Mono";
          style = "Bold SemiCondensed";
        };
        size = 12;
        offset = {
          x = 0;
          y = 0;
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };
        builtin_box_drawing = false;
      };

      bell = {
        animation = "EaseOutExpo";
        duration = 0;
        color = "0xffffff";
      };

      mouse = {
        bindings = [
          {
            mouse = "Middle";
            action = "PasteSelection";
          }
        ];
      };

      selection = {
        semantic_escape_chars = ",?`|:\"' ()[]{}<>";
        save_to_clipboard = true;
      };

      cursor = {
        style = "Block";
        unfocused_hollow = true;
      };
    };
  };
}
