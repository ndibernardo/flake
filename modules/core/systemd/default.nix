{
  flake.nixosModules.core-systemd =
    { config, lib, ... }:
    let
      cfg = config.core.systemd;
    in
    {
      options.core.systemd.enable = lib.mkEnableOption "systemd target policy";

      config = lib.mkIf cfg.enable {
        # this machine never sleeps; it either runs or is off
        systemd.targets = {
          hibernate.enable = false;
          hybrid-sleep.enable = false;
          sleep.enable = false;
          suspend.enable = false;
        };
      };
    };
}
