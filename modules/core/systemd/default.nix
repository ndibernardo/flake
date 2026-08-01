{
  flake.nixosModules.core-systemd =
    { config, lib, ... }:
    let
      cfg = config.core.systemd;
    in
    {
      options.core.systemd.enable = lib.mkEnableOption "systemd, D-Bus and journald policy";

      config = lib.mkIf cfg.enable {
        systemd.targets = {
          hibernate.enable = false;
          hybrid-sleep.enable = false;
          sleep.enable = false;
          suspend.enable = false;
        };

        services.dbus = {
          enable = true;
          implementation = "broker";
        };

        services.journald = {
          extraConfig = ''
            SyncIntervalSec=30
            SystemMaxUse=500M
            SystemMaxFileSize=50M
          '';
          storage = "volatile";
          upload.enable = false;
        };

        systemd.services.systemd-journald.serviceConfig = {
          PrivateNetwork = true;
          ProtectHostname = true;
          ProtectKernelModules = true;
          UMask = "0077";
        };
      };
    };
}
