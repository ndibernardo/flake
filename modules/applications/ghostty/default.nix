{
  flake.nixosModules.applications-ghostty =
    { config, lib, ... }:
    let
      cfg = config.applications.ghostty;
      user = config.user;
    in
    {
      options.applications.ghostty.enable = lib.mkEnableOption "Ghostty";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;

        home-manager.users.${user.name} = {
          programs.ghostty = {
            enable = true;
            themes = {
              pragmata = {
                palette = [
                  "0=#000000"
                  "1=#e41507"
                  "2=#329033"
                  "3=#9E7400"
                  "4=#2981ca"
                  "5=#9805AE"
                  "6=#2E998E"
                  "7=#DDDDDD"
                  "8=#000000"
                  "9=#e41507"
                  "10=#329033"
                  "11=#9E7400"
                  "12=#2981ca"
                  "13=#9805AE"
                  "14=#2E998E"
                  "15=#ffffff"
                ];
                background = "#f5f5f5";
                foreground = "#000000";
                cursor-color = "#404040";
                cursor-text = "#f5f5f5";
                selection-background = "#d0d0d0";
                selection-foreground = "#000000";
              };
            };
            settings = {
              adjust-cell-height = "20%";
              bold-is-bright = true;
              cursor-style = "block";
              cursor-style-blink = false;
              font-family = "monospace";
              font-size = 13;
              font-thicken = true;
              scrollback-limit = 10000;
              shell-integration-features = "no-cursor";
              window-decoration = "client";
              window-height = 65;
              window-padding-x = 10;
              window-padding-y = 10;
              window-width = 150;
              theme = "light:pragmata,dark:Tomorrow Night";
            };
          };
        };
      };
    };
}
