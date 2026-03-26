{ ... }:
{
  flake.nixosModules.alacritty = (
    { user, font, colors, colorLib, ... }:
    {
    home-manager.users.${user.name}.programs.alacritty = {
      enable = true;
      settings = {
        colors = {
          primary = {
            background = colors.black;
            foreground = colors.white;
          };
          cursor = {
            text   = colors.black;
            cursor = colors.white;
          };
          normal = {
            black   = colors.black;
            red     = colors.red;
            green   = colors.green;
            yellow  = colors.yellow;
            blue    = colors.blue;
            magenta = colors.magenta;
            cyan    = colors.cyan;
            white   = colors.white;
          };
          bright = {
            black   = colors.brightBlack;
            red     = colors.brightRed;
            green   = colors.brightGreen;
            yellow  = colors.brightYellow;
            blue    = colors.brightBlue;
            magenta = colors.brightMagenta;
            cyan    = colors.brightCyan;
            white   = colors.brightWhite;
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
            family = font.family;
            style = font.style;
          };
          bold = {
            family = font.family;
            style = "Bold SemiCondensed";
          };
          size = font.size;
          offset = {
            x = 0;
            y = 0;
          };
          glyph_offset = {
            x = 0;
            y = 0;
          };
          builtin_box_drawing = true;
        };

        bell = {
          animation = "EaseOutExpo";
          duration = 0;
          color = "0xffffff";
        };

        mouse.bindings = [
          {
            mouse = "Middle";
            action = "PasteSelection";
          }
        ];

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
  );
}
