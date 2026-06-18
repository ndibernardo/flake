{ ... }:
{
  flake.nixosModules.fuzzel = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            font = "Berkeley Mono:size=14:style=Regular SemiCondensed";
            terminal = "ghostty -e";
            width = 30;
            lines = 10;
            prompt = ''">> "'';
          };
          colors = {
            background      = "14171dff"; # bg
            text            = "c5c9c7ff"; # fg
            match           = "7fb4caff"; # blue
            selection       = "393b44ff"; # bg3
            selection-text  = "c5c9c7ff"; # fg
            selection-match = "7fb4caff"; # blue
            border          = "393b44ff"; # bg2
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
