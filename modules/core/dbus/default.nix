{
  flake.nixosModules.core-dbus =
    { config, lib, ... }:
    let
      cfg = config.core.dbus;
    in
    {
      options.core.dbus.enable = lib.mkEnableOption "dbus-broker";

      config = lib.mkIf cfg.enable {
        services.dbus = {
          enable = true;
          implementation = "broker";
        };
      };
    };
}
