{
  flake.nixosModules.desktop-fuzzel =
    { config, lib, ... }:
    let
      cfg = config.desktop.fuzzel;
      user = config.user;
    in
    {
      options.desktop.fuzzel.enable = lib.mkEnableOption "fuzzel";

      config = lib.mkIf cfg.enable {
        core.fonts.enable = true;
        core.home-manager.enable = true;
        applications.alacritty.enable = true;

        home-manager.users.${user.name}.programs.fuzzel = {
          enable = true;
          settings = {
            main = {
              terminal = "alacritty -e";
              font = "Departure Mono:size=12";
              width = 30;
              lines = 10;
              prompt = ''""'';
            };
            border = {
              width = 0;
              radius = 0;
            };
            colors = {
              background = "16161dff";
              text = "efeff4ff";
              match = "f97316ff";
              selection = "292936ff";
              selection-text = "efeff4ff";
              selection-match = "f97316ff";
            };
          };
        };
      };
    };
}
