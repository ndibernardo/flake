{ ... }:
{
  flake.nixosModules.systemd = (
    { lib, ... }:
    {
      systemd = {
        targets = {
          hibernate.enable = false;
          hybrid-sleep.enable = false;
          sleep.enable = false;
          suspend.enable = false;
        };

        services = {
          bluetooth.serviceConfig = {
            ProtectControlGroups = true;
            ProtectHostname = true;
            ProtectKernelLogs = lib.mkDefault true;
            ProtectKernelModules = lib.mkDefault true;
            ProtectKernelTunables = lib.mkDefault true;
            ProtectProc = "invisible";
            SystemCallArchitectures = "native";
            SystemCallFilter = [
              "~@cpu-emulation"
              "~@mount"
              "~@obsolete"
              "~@reboot"
              "~@swap"
            ];
          };

          systemd-journald.serviceConfig = {
            PrivateNetwork = true;
            ProtectHostname = true;
            ProtectKernelModules = true;
            UMask = 0077;
          };

          systemd-rfkill.serviceConfig = {
            IPAddressDeny = "any";
            LockPersonality = true;
            MemoryDenyWriteExecute = true;
            NoNewPrivileges = true;
            PrivateTmp = true;
            ProcSubset = "pid";
            ProtectClock = true;
            ProtectControlGroups = true;
            ProtectHome = true;
            ProtectKernelModules = true;
            ProtectKernelTunables = true;
            ProtectProc = "invisible";
            ProtectSystem = "strict";
            RestrictRealtime = true;
            SystemCallArchitectures = "native";
            UMask = "0077";
          };
        };
      };
    }
  );
}
