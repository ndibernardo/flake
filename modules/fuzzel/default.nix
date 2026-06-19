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
            background      = "f5f5f5ff"; # bg
            text            = "000000ff"; # fg
            match           = "2981caff"; # blue
            selection       = "e0e0e0ff"; # region
            selection-text  = "000000ff"; # fg
            selection-match = "2981caff"; # blue
            border          = "d0d0d0ff"; # border
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
