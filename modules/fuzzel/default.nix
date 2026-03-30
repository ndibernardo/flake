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
            terminal = "alacritty -e";
            width = 30;
            lines = 10;
            prompt = ''">> "'';
          };
          colors = {
            background      = "040606ff";
            text            = "C5C9C7ff";
            match           = "7AA89Fff";
            selection       = "7AA89Fff";
            selection-text  = "040606ff";
            selection-match = "040606ff";
            border          = "22262Dff";
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
