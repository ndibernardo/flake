{ ... }:
{
  flake.nixosModules.fuzzel = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            font = "Berkeley Mono:size=14";
            terminal = "ghostty -e";
            width = 30;
            lines = 10;
            prompt = ''">> "'';
          };
          colors = {
            background      = "1d1f21ff";
            text            = "c5c8c6ff";
            match           = "81a2beff";
            selection       = "373b41ff";
            selection-text  = "c5c8c6ff";
            selection-match = "81a2beff";
            border          = "282a2eff";
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
