{
  flake.nixosModules.core-hardening =
    { config, lib, ... }:
    let
      cfg = config.core.hardening;
    in
    {
      options.core.hardening.enable = lib.mkEnableOption "kernel, module and service hardening policy";

      config = lib.mkIf cfg.enable {
        boot = {
          # rare network protocols and filesystems, none of which are used here
          blacklistedKernelModules = [
            "dccp"
            "nouveau"
            "rds"
            "sctp"
            "tipc"
            "n-hdlc"
            "ax25"
            "netrom"
            "x25"
            "rose"
            "decnet"
            "econet"
            "af_802154"
            "ipx"
            "appletalk"
            "psnap"
            "p8023"
            "p8022"
            "can"
            "atm"
            "cramfs"
            "freevxfs"
            "jffs2"
            "hfs"
            "hfsplus"
            "udf"
            "squashfs"
            "cifs"
            "nfs"
            "nfsv3"
            "nfsv4"
            "ksmbd"
            "gfs2"
            "vivid"
          ];

          extraModprobeConfig = ''
            install dccp /bin/true
            install sctp /bin/true
            install rds /bin/true
            install tipc /bin/true
          '';
        };

        security = {
          protectKernelImage = true;
          sudo.execWheelOnly = true;
        };

        # sandboxing for units that ship without it
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

          systemd-journald.serviceConfig = {
            PrivateNetwork = true;
            ProtectHostname = true;
            ProtectKernelModules = true;
            UMask = "0077";
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
