{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "0x000000";
          foreground = "0xffffff";
        };

        cursor = {
          text = "0x000000";
          cursor = "0xffffff";
        };

        normal = {
          black = "0x16181a";
          red = "0xff6e5e";
          green = "0x5eff6c";
          yellow = "0xf1ff5e";
          blue = "0x5ea1ff";
          magenta = "0xbd5eff";
          cyan = "0x5ef1ff";
          white = "0xffffff";
        };

        bright = {
          black = "0x3c4048";
          red = "0xff6e5e";
          green = "0x5eff6c";
          yellow = "0xf1ff5e";
          blue = "0x5ea1ff";
          magenta = "0xbd5eff";
          cyan = "0x5ef1ff";
          white = "0xffffff";
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
