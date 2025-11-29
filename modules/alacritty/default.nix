{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "0x1d1f21";
          foreground = "0xc5c8c6";
        };

        cursor = {
          text = "0x1d1f21";
          cursor = "0xffffff";
        };

        normal = {
          black = "0x1d1f21";
          red = "0xcc6666";
          green = "0xb5bd68";
          yellow = "0xe6c547";
          blue = "0x81a2be";
          magenta = "0xb294bb";
          cyan = "0x70c0ba";
          white = "0x373b41";
        };

        bright = {
          black = "0x666666";
          red = "0xff3334";
          green = "0x9ec400";
          yellow = "0xf0c674";
          blue = "0x81a2be";
          magenta = "0xb77ee0";
          cyan = "0x54ced6";
          white = "0x282a2e";
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
