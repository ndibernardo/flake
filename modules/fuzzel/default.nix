{ ... }:
{
  flake.nixosModules.fuzzel = (
    { user, font, colors, colorLib, ... }:
    let
      rgba = colorLib.rgba;
    in
    {
      home-manager.users.${user.name}.programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            font = "${font.family}:size=${toString font.size}:style=${font.style}";
            terminal = "alacritty -e";
            width = 30;
            lines = 10;
            prompt = ''">> "'';
          };
          colors = {
            background       = rgba colors.black;
            text             = rgba colors.white;
            match            = rgba colors.cyan;
            selection        = rgba colors.accent;
            selection-text   = rgba colors.base;
            selection-match  = rgba colors.base;
            border           = rgba colors.surface;
          };
          border = {
            width = 2;
            radius = 0;
          };
        };
      };
    }
  );
}
