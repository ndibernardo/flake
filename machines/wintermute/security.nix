{
  lib,
  pkgs,
  ...
}:

{
  environment = {
    defaultPackages = lib.mkForce [ ];
  };

  programs = {
    firejail = {
      enable = true;
      wrappedBinaries = {
        librewolf = {
          executable = "${pkgs.librewolf}/bin/librewolf";
          profile = "${pkgs.firejail}/etc/firejail/librewolf.profile";
        };
        nicotine = {
          executable = "${pkgs.nicotine-plus}/bin/nicotine";
          profile = "${pkgs.firejail}/etc/firejail/nicotine.profile";
        };
        steam = {
          executable = "${pkgs.steam}/bin/steam";
          profile = "${pkgs.firejail}/etc/firejail/steam.profile";
        };
        ungoogled-chromium = {
          executable = "${pkgs.ungoogled-chromium}/bin/chromium";
          profile = "${pkgs.firejail}/etc/firejail/chromium.profile";
        };
      };
    };
  };

  security = {
    audit = {
      enable = true;
      rules = [
        "-a exit,always -F arch=b64 -S execve"
      ];
    };
    auditd = {
      enable = true;
    };
    rtkit = {
      enable = true;
    };
    sudo = {
      execWheelOnly = true;
    };
  };

  services = {
    clamav = {
      daemon = {
        enable = true;
      };
      scanner = {
        enable = true;
        interval = "*-*-* 04:00:00";
        scanDirectories = [
          "/etc"
          "/home"
          "/tmp"
          "/var/lib"
          "/var/tmp"
        ];
      };
      updater = {
        enable = true;
        frequency = 12;
      };
    };

    cron = {
      enable = true;
      systemCronJobs = [
        "0 11 * * * ${pkgs.aide}/bin/aide --check --config /var/lib/aide/aide.conf"
      ];
    };

    dbus = {
      enable = true;
      implementation = "broker";
    };

    journald = {
      extraConfig = ''
        SystemMaxUse=500M
        SystemMaxFileSize=50M
      '';
      storage = "volatile";
      upload = {
        enable = false;
      };
    };

    logrotate = {
      enable = true;
    };
  };

  systemd = {
    services = {
      bluetooth = {
        serviceConfig = {
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
      };

      systemd-journald = {
        serviceConfig = {
          PrivateNetwork = true;
          ProtectHostname = true;
          ProtectKernelModules = true;
          UMask = 0077;
        };
      };

      systemd-rfkill = {
        serviceConfig = {
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

  users = {
    groups = {
      netdev = { };
    };
  };
}
