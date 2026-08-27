{
  flake.nixosModules.applications-alacritty =
    { config, lib, ... }:
    let
      cfg = config.applications.alacritty;
      user = config.user;
      palette = {
        background = "0x16161d";
        backgroundAlt = "0x212128";
        foregroundDim = "0x9ca0a4";
        foreground = "0xccccd6";
        foregroundBright = "0xf8f8fb";
        blackBright = "0x5b6268";
        red = "0xff8888";
        green = "0x86da87";
        greenBright = "0xa1f6a1";
        yellow = "0xdada86";
        blueDark = "0x86aeda";
        blue = "0xaaccff";
        violet = "0xb286db";
        magenta = "0xdb85d9";
        cyanDark = "0x64a2a4";
        cyan = "0x86d9db";
        white = "0xf8f8fb";
      };
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
                  background = palette.background;
                  foreground = palette.foreground;
                  dim_foreground = palette.foregroundDim;
                  bright_foreground = palette.foregroundBright;
                };

                cursor = {
                  text = palette.background;
                  cursor = palette.white;
                };

                vi_mode_cursor = {
                  text = palette.background;
                  cursor = palette.cyan;
                };

                selection = {
                  text = palette.background;
                  background = palette.blueDark;
                };

                search = {
                  matches = {
                    foreground = palette.background;
                    background = palette.yellow;
                  };
                  focused_match = {
                    foreground = palette.background;
                    background = palette.blue;
                  };
                };

                hints = {
                  start = {
                    foreground = palette.background;
                    background = palette.yellow;
                  };
                  end = {
                    foreground = palette.background;
                    background = palette.cyan;
                  };
                };

                line_indicator = {
                  foreground = palette.foregroundDim;
                  background = palette.backgroundAlt;
                };

                footer_bar = {
                  foreground = palette.foreground;
                  background = palette.backgroundAlt;
                };

                normal = {
                  black = palette.backgroundAlt;
                  red = palette.red;
                  green = palette.green;
                  yellow = palette.yellow;
                  blue = palette.blueDark;
                  magenta = palette.violet;
                  cyan = palette.cyanDark;
                  white = palette.foreground;
                };

                bright = {
                  black = palette.blackBright;
                  red = palette.red;
                  green = palette.greenBright;
                  yellow = palette.yellow;
                  blue = palette.blue;
                  magenta = palette.magenta;
                  cyan = palette.cyan;
                  white = palette.foregroundBright;
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
                color = palette.red;
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
