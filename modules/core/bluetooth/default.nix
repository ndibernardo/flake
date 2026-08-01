{
  flake.nixosModules.core-bluetooth =
    { config, lib, ... }:
    let
      cfg = config.core.bluetooth;
    in
    {
      options.core.bluetooth.enable = lib.mkEnableOption "Bluetooth support";

      config = lib.mkIf cfg.enable {
        hardware.bluetooth = {
          enable = true;
          powerOnBoot = true;
        };

        systemd.services = {
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
    };
}
