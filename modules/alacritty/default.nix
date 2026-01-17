{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "0x000000";
          foreground = "0xdddddd";
        };

        cursor = {
          text = "0x000000";
          cursor = "0xdddddd";
        };

        normal = {
          black = "0x000000";
          red = "0xcf9292";
          green = "0x73cc98";
          yellow = "0xc7ae95";
          blue = "0x95aec7";
          magenta = "0xae95c7";
          cyan = "0x7bd3c5";
          white = "0xdddddd";
        };

        bright = {
          black = "0x747c84";
          red = "0xcf9292";
          green = "0x73cc98";
          yellow = "0xc7ae95";
          blue = "0x95aec7";
          magenta = "0xae95c7";
          cyan = "0x7bd3c5";
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
