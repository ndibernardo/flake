{
  flake.nixosModules.desktop-greetd =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.greetd;
      sessions = config.services.displayManager.sessionData.desktops;
    in
    {
      options.desktop.greetd.enable = lib.mkEnableOption "greetd with the tuigreet greeter";

      config = lib.mkIf cfg.enable {
        services.greetd = {
          enable = true;
          useTextGreeter = true;
          settings.default_session = {
            command = lib.escapeShellArgs [
              (lib.getExe pkgs.tuigreet)
              "--time"
              "--remember"
              "--remember-user-session"
              "--asterisks"
              "--sessions"
              "${sessions}/share/wayland-sessions"
            ];
            user = "greeter";
          };
        };
      };
    };
}
