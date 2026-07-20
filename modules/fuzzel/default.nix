{ ... }:
{
  flake.nixosModules.fuzzel = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            terminal = "ghostty -e";
            font = "JetBrains Mono:size=12";
            width = 30;
            lines = 10;
            prompt = ''""'';
          };
          border = {
            width = 2;
            radius = 3;
          };
          colors = {
            background = "1d1f21ff";
            text = "c5c8c6ff";
            match = "81a2beff";
            selection = "81a2beff";
            selection-text = "1d1f21ff";
            selection-match = "1d1f21ff";
            border = "1d1f21ff";
          };
        };
      };
    }
  );
}
