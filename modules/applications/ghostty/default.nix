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
            themes.photopic = {
              palette = [
                "0=#000000"
                "1=#ba3821"
                "2=#1a8210"
                "3=#886600"
                "4=#4e5ecc"
                "5=#9a40a1"
                "6=#007d70"
                "7=#f0f0f0"
                "8=#999999"
                "9=#8f1700"
                "10=#065e00"
                "11=#624800"
                "12=#3237b2"
                "13=#7c0984"
                "14=#005a50"
                "15=#ffffff"
              ];
              background = "#ffffff";
              foreground = "#000000";
              cursor-color = "#000000";
              cursor-text = "#ffffff";
              selection-background = "#f0f0f0";
              selection-foreground = "#000000";
            };
            settings = {
              adjust-cell-height = "20%";
              bold-is-bright = true;
              cursor-style = "block";
              cursor-style-blink = false;
              font-family = "JetBrains Mono";
              font-size = 13;
              font-thicken = true;
              scrollback-limit = 10000;
              shell-integration-features = "no-cursor";
              window-decoration = "client";
              window-height = 65;
              window-padding-x = 10;
              window-padding-y = 10;
              window-width = 150;
              theme = "light:photopic,dark:Tomorrow Night";
            };
          };
        };
      };
    };
}
