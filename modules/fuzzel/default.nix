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
            background      = "16161dff"; # bg
            text            = "b2b2bbff"; # fg
            match           = "4db5bdff"; # teal – functions
            selection       = "22222cff"; # bg-highlight
            selection-text  = "b2b2bbff"; # fg
            selection-match = "4db5bdff"; # teal
            border          = "3a3a48ff"; # base4 – outline
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
