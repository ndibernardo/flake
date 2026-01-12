{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "0x090E13";
          foreground = "0xC5C9C7";
        };

        cursor = {
          text = "0x090E13";
          cursor = "0xC5C9C7";
        };

        normal = {
          black = "0x090E13";
          red = "0xCA675F";
          green = "0x7F9F6E";
          yellow = "0xCAAC7A";
          blue = "0x7EAABA";
          magenta = "0xA08AA2";
          cyan = "0xC5C9C7";
          white = "0xA4A7A4";
        };

        bright = {
          black = "0x909398";
          red = "0xED5965";
          green = "0x7CAF7C";
          yellow = "0xEDC272";
          blue = "0x6EBBD4";
          magenta = "0x8A88B0";
          cyan = "0x6BAE97";
          white = "0xC5C9C7";
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
          style = "Medium SemiCondensed";
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
