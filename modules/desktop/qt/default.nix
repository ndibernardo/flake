{
  flake.nixosModules.desktop-qt =
    { config, lib, ... }:
    let
      cfg = config.desktop.qt;
      user = config.user;
    in
    {
      options.desktop.qt.enable = lib.mkEnableOption "Qt theming";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;

        home-manager.users.${user.name}.qt = {
          enable = true;
          platformTheme.name = "gtk3";
        };
      };
    };
}
