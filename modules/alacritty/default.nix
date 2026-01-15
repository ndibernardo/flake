{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "0x1d2021";
          foreground = "0xebdbb2";
        };

        cursor = {
          text = "0x1d2021";
          cursor = "0xebdbb2";
        };

        normal = {
          black = "0x1d2021";
          red = "0xcc241d";
          green = "0x98971a";
          yellow = "0xd79921";
          blue = "0x458588";
          magenta = "0xb16286";
          cyan = "0x689d6a";
          white = "0xa89984";
        };

        bright = {
          black = "0x928374";
          red = "0xfb4934";
          green = "0xb8bb26";
          yellow = "0xfabd2f";
          blue = "0x83a598";
          magenta = "0xd3869b";
          cyan = "0x8ec07c";
          white = "0xebdbb2";
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
