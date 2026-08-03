{
  flake.nixosModules.core-systemd =
    { config, lib, ... }:
    let
      cfg = config.core.systemd;

      maintenanceSandbox = {
        CapabilityBoundingSet = [ "" ];
        LockPersonality = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        PrivateDevices = true;
        PrivateTmp = true;
        ProtectClock = true;
        ProtectControlGroups = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        ProtectSystem = "strict";
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        SystemCallArchitectures = "native";
        SystemCallFilter = [
          "@system-service"
          "~@privileged @resources"
        ];
      };

      sysstatEnabled = config.services.sysstat.enable;

      mandbEnabled =
        config.documentation.man.man-db.enable && config.documentation.man.cache.generateAtRuntime;
    in
    {
      options.core.systemd.enable = lib.mkEnableOption "systemd, D-Bus, journald and timesyncd policy";

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

        systemd.coredump.settings.Coredump.Storage = "none";

        services.timesyncd.settings.Time.PollIntervalMaxSec = 1024;

        services.journald = {
          extraConfig = ''
            SyncIntervalSec=30
            SystemMaxUse=500M
            SystemMaxFileSize=50M
          '';
          storage = "volatile";
          upload.enable = false;
        };

        systemd.services = {
          systemd-journald.serviceConfig = {
            PrivateNetwork = true;
            ProtectHostname = true;
            ProtectKernelModules = true;
            UMask = "0077";
          };

          sysstat-collect = lib.mkIf sysstatEnabled {
            serviceConfig = maintenanceSandbox // {
              LogsDirectory = "sa";
              RestrictAddressFamilies = [
                "AF_UNIX"
                "AF_NETLINK"
              ];
              UMask = "0027";
            };
          };

          sysstat-summary = lib.mkIf sysstatEnabled {
            serviceConfig = maintenanceSandbox // {
              LogsDirectory = "sa";
              RestrictAddressFamilies = [
                "AF_UNIX"
                "AF_NETLINK"
              ];
              UMask = "0027";
            };
          };

          mandb = lib.mkIf mandbEnabled {
            serviceConfig = maintenanceSandbox // {
              PrivateNetwork = true;
              ProcSubset = "pid";
              ProtectProc = "invisible";
              RestrictAddressFamilies = [ "AF_UNIX" ];
              UMask = "0022";
            };
          };
        };
      };
    };
}
