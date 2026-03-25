{ ... }:
{
  flake.nixosModules.fuzzel = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            font = "Berkeley Mono:size=12:style=Regular SemiCondensed";
            terminal = "alacritty -e";
            width = 30;
            lines = 10;
            prompt = ''">> "'';
          };
          colors = {
            background = "000000ff";
            text = "ddddddff";
            match = "7bd3c5ff";
            selection = "54beafff";
            selection-text = "1d1f21ff";
            selection-match = "1d1f21ff";
            border = "282a2eff";
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
