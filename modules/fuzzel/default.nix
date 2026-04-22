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
            background      = "1d2021ff"; # bg hard
            text            = "ebdbb2ff"; # fg
            match           = "fabd2fff"; # yellow
            selection       = "504945ff"; # bg3
            selection-text  = "ebdbb2ff"; # fg
            selection-match = "fabd2fff"; # yellow
            border          = "3c3836ff"; # bg1
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
