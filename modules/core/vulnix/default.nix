{
  flake.nixosModules.core-vulnix =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.core.vulnix;

      cacheDir = "/var/cache/vulnix";
      stateDir = "/var/lib/vulnix";
      report = "${stateDir}/report.json";

      scan = pkgs.writeShellApplication {
        name = "vulnix-scan";
        runtimeInputs = [
          pkgs.vulnix
          pkgs.jq
          config.nix.package
        ];
        text = ''
          rc=0
          vulnix --system --json --cache-dir ${cacheDir} \
            ${lib.concatMapStringsSep " " (w: "--whitelist ${lib.escapeShellArg w}") cfg.whitelists} \
            > ${report} || rc=$?

          if ! jq -e 'type == "array"' ${report} > /dev/null 2>&1; then
            echo "vulnix wrote no usable report (exit $rc) - see the error above" >&2
            exit 1
          fi

          affected=$(jq 'length' ${report})

          if [ "$affected" -eq 0 ]; then
            echo "no known vulnerabilities in the system closure"
            exit 0
          fi

          echo "$affected affected packages (full report in ${report}):"
          jq -r '.[] | "  \(.name)  \(.affected_by | join(" "))"' ${report}
        '';
      };
    in
    {
      options.core.vulnix = {
        enable = lib.mkEnableOption "scheduled CVE scan of the system closure";

        interval = lib.mkOption {
          type = lib.types.str;
          default = "weekly";
          description = "systemd calendar expression deciding how often the scan runs.";
        };

        whitelists = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          example = [ "/etc/vulnix/accepted.toml" ];
          description = ''
            TOML whitelists handed to vulnix, for matches already judged
            irrelevant. Seed one from the current findings with
            `vulnix --system --write-whitelist accepted.toml`.
          '';
        };
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [ pkgs.vulnix ];

        systemd.services.vulnix = {
          description = "Scan the system closure for known vulnerabilities";
          after = [ "network-online.target" ];
          wants = [ "network-online.target" ];

          serviceConfig = {
            Type = "oneshot";
            ExecStart = lib.getExe scan;

            Restart = "on-failure";
            RestartSec = "15min";

            CPUSchedulingPolicy = "idle";
            IOSchedulingClass = "idle";
            MemoryMax = "3G";
            Nice = 19;

            DynamicUser = true;
            CacheDirectory = "vulnix";
            StateDirectory = "vulnix";
            Environment = [ "HOME=${cacheDir}" ];

            CapabilityBoundingSet = [ "" ];
            LockPersonality = true;
            MemoryDenyWriteExecute = true;
            NoNewPrivileges = true;
            PrivateDevices = true;
            ProcSubset = "pid";
            ProtectClock = true;
            ProtectControlGroups = true;
            ProtectHome = true;
            ProtectHostname = true;
            ProtectKernelLogs = true;
            ProtectKernelModules = true;
            ProtectKernelTunables = true;
            ProtectProc = "invisible";
            ProtectSystem = "strict";
            RestrictAddressFamilies = [
              "AF_UNIX"
              "AF_INET"
              "AF_INET6"
            ];
            RestrictNamespaces = true;
            RestrictRealtime = true;
            RestrictSUIDSGID = true;
            SystemCallArchitectures = "native";
            SystemCallFilter = [
              "@system-service"
              "~@privileged @resources"
            ];
            UMask = "0077";
          };

          unitConfig = {
            StartLimitBurst = 3;
            StartLimitIntervalSec = "2h";
          };
        };

        systemd.timers.vulnix = {
          description = "Periodic CVE scan of the system closure";
          wantedBy = [ "timers.target" ];
          timerConfig = {
            OnCalendar = cfg.interval;
            Persistent = true;
            RandomizedDelaySec = "1h";
          };
        };
      };
    };
}
