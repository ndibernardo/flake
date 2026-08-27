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
              background = "1a1a1aff";
              text = "efefefff";
              match = "f97316ff";
              selection = "303030ff";
              selection-text = "efefefff";
              selection-match = "f97316ff";
            };
          };
        };
      };
    };
}
