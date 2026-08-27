{
  flake.nixosModules.applications-alacritty =
    { config, lib, ... }:
    let
      cfg = config.applications.alacritty;
      user = config.user;
    in
    {
      options.applications.alacritty.enable = lib.mkEnableOption "Alacritty";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;
        environment.sessionVariables.TERMINAL = lib.mkDefault "alacritty";

        home-manager.users.${user.name} = {
          programs.alacritty = {
            enable = true;
            settings = {
              colors = {
                primary = {
                  background = "0x16161d";
                  foreground = "0xccccd6";
                };

                cursor = {
                  text = "0x16161d";
                  cursor = "0xffffff";
                };

                selection = {
                  text = "0xccccd6";
                  background = "0x626276";
                };

                normal = {
                  black = "0x1e1e28";
                  red = "0xff8888";
                  green = "0xaaffaa";
                  yellow = "0xaaeecc";
                  blue = "0xaaccff";
                  magenta = "0xff1f69";
                  cyan = "0xaadddd";
                  white = "0x9999aa";
                };

                bright = {
                  black = "0x16161d";
                  red = "0xff8888";
                  green = "0x626276";
                  yellow = "0x9999aa";
                  blue = "0xccccd6";
                  magenta = "0xccaaff";
                  cyan = "0xb0b0bd";
                  white = "0xf8f8fb";
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
                decorations = "none";
                opacity = 1.0;
              };

              scrolling = {
                history = 10000;
                multiplier = 3;
              };

              font = {
                normal = {
                  family = "Berkeley Mono";
                  style = "Book SemiCondensed";
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
                color = "0xf8f8fb";
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
        };
      };
    };
}
