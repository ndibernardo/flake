{ ... }:
{
  flake.nixosModules.fuzzel = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            font = "PragmataPro Mono:size=14";
            terminal = "ghostty -e";
            width = 30;
            lines = 10;
            prompt = ''">> "'';
          };
          colors = {
            background      = "f5f5f5ff"; # bg
            text            = "000000ff"; # fg
            match           = "ff5000ff"; # te orange
            selection       = "e0e0e0ff"; # region
            selection-text  = "000000ff"; # fg
            selection-match = "ff5000ff"; # te orange
            border          = "ff5000ff"; # te orange
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
