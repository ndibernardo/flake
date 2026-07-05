{ ... }:
{
  flake.nixosModules.ghostty = (
    { user, ... }:
    {
      home-manager.users.${user.name} = {
        programs.ghostty = {
          enable = true;
          settings = {
            adjust-cell-height = "15%";
            bold-is-bright = true;
            cursor-style = "block";
            cursor-style-blink = false;
            font-size = 13;
            font-thicken = true;
            scrollback-limit = 10000;
            shell-integration-features = "no-cursor";
            window-decoration = "client";
            window-height = 65;
            window-padding-x = 10;
            window-padding-y = 10;
            window-width = 150;
            theme = "light:Tomorrow,dark:Tomorrow Night";
          };
        };
      };
    }
  );
}
