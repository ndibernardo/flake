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
            settings = {
              adjust-cell-height = "10%";
              bold-is-bright = true;
              cursor-style = "block";
              cursor-style-blink = false;
              font-family = "Berkeley Mono";
              font-size = 12;
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
      };
    };
}
