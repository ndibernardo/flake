{ ... }:
{
  flake.nixosModules.ghostty = (
    { user, ... }:
    {
      home-manager.users.${user.name} = {
        programs.ghostty = {
          enable = true;
          settings = {
            font-size = 12;
            window-padding-x = 10;
            window-padding-y = 10;
            scrollback-limit = 10000;

            theme = "Pragmata";
          };
        };

        xdg.configFile."ghostty/themes/Pragmata".text = ''
          background = f5f5f5
          foreground = 000000
          cursor-color = 404040
          cursor-text = f5f5f5
          selection-background = d0d0d0
          selection-foreground = 000000

          palette = 0=#f5f5f5
          palette = 1=#e41507
          palette = 2=#329033
          palette = 3=#9E7400
          palette = 4=#2981ca
          palette = 5=#9805AE
          palette = 6=#2E998E
          palette = 7=#000000
          palette = 8=#606060
          palette = 9=#e41507
          palette = 10=#329033
          palette = 11=#E6BB00
          palette = 12=#1e73be
          palette = 13=#9805AE
          palette = 14=#2E998E
          palette = 15=#000000
        '';
      };
    }
  );
}
