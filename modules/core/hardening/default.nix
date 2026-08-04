{
  flake.nixosModules.core-hardening =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.core.hardening;

      pwqualityServices = [
        "passwd"
        "chpasswd"
      ];
    in
    {
      options.core.hardening.enable = lib.mkEnableOption "kernel, module and credential hardening policy";

      config = lib.mkIf cfg.enable {
        boot = {
          tmp.cleanOnBoot = true;

          kernel.sysctl = {
            "fs.protected_fifos" = 2;
            "fs.protected_regular" = 2;
            "fs.protected_hardlinks" = 1;
            "fs.protected_symlinks" = 1;
            "fs.suid_dumpable" = 0;

            "kernel.kptr_restrict" = 2;
            "kernel.sysrq" = 0;
            "kernel.unprivileged_bpf_disabled" = 1;
            "kernel.unprivileged_userns_clone" = 1;
            "kernel.kexec_load_disabled" = 1;
            "kernel.perf_event_paranoid" = 3;
            "kernel.dmesg_restrict" = 1;
            "kernel.randomize_va_space" = 2;
            "kernel.yama.ptrace_scope" = 1;

            "dev.tty.ldisc_autoload" = 0;
            "vm.unprivileged_userfaultfd" = 0;

            "net.core.bpf_jit_harden" = 2;

            "net.ipv4.conf.all.forwarding" = 0;
            "net.ipv4.conf.all.accept_redirects" = 0;
            "net.ipv4.conf.default.accept_redirects" = 0;
            "net.ipv6.conf.all.accept_redirects" = 0;
            "net.ipv6.conf.default.accept_redirects" = 0;

            "net.ipv4.conf.all.log_martians" = 1;
            "net.ipv4.conf.default.log_martians" = 1;

            "net.ipv4.conf.all.rp_filter" = 2;
            "net.ipv4.conf.default.rp_filter" = 2;

            "net.ipv4.conf.all.send_redirects" = 0;
            "net.ipv4.conf.default.send_redirects" = 0;
            "net.ipv4.conf.all.accept_source_route" = 0;
            "net.ipv4.conf.default.accept_source_route" = 0;
            "net.ipv6.conf.all.accept_source_route" = 0;

            "net.ipv4.tcp_syncookies" = 1;
            "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
            "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
          };

          # Rare network protocols and filesystems, unused here.
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

          pam.services = lib.genAttrs pwqualityServices (_: {
            rules.password = {
              pwquality = {
                order = 10000;
                control = "required";
                modulePath = "${pkgs.libpwquality.lib}/lib/security/pam_pwquality.so";
                settings = {
                  dcredit = 0;
                  dictcheck = 1;
                  enforce_for_root = true;
                  gecoscheck = 1;
                  lcredit = 0;
                  maxrepeat = 3;
                  minclass = 2;
                  minlen = 12;
                  ocredit = 0;
                  retry = 3;
                  ucredit = 0;
                };
              };

              unix.settings.use_authtok = true;
            };
          });
        };
      };
    };
}
