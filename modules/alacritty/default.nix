{ ... }:
{
  flake.nixosModules.alacritty = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.alacritty = {
        enable = true;
        settings = {
          colors = {
            primary = {
              background = "#040606";
              foreground = "#C5C9C7";
            };
            cursor = {
              text   = "#040606";
              cursor = "#C5C9C7";
            };
            normal = {
              black   = "#040606";
              red     = "#C34043";
              green   = "#98BB6C";
              yellow  = "#DCA561";
              blue    = "#7FB4CA";
              magenta = "#938AA9";
              cyan    = "#7AA89F";
              white   = "#C5C9C7";
            };
            bright = {
              black   = "#717C7C";
              red     = "#E46876";
              green   = "#98BB6C";
              yellow  = "#E6C384";
              blue    = "#658594";
              magenta = "#938AA9";
              cyan    = "#7AA89F";
              white   = "#DCD7BA";
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
              style = "Regular SemiCondensed";
            };
            bold = {
              family = "Berkeley Mono";
              style = "Bold SemiCondensed";
            };
            size = 14;
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
