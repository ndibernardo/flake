{
  pkgs,
  config,
  lib,
  ...
}:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 20;
      };
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
      luks.devices = {
        "luks-e8eb023d-65f2-4922-9292-e8eaff31abcf" = {
          device = "/dev/disk/by-uuid/e8eb023d-65f2-4922-9292-e8eaff31abcf";
        };
      };
    };

    kernel.sysctl = {
      "fs.protected_fifos" = 2;
      "fs.protected_regular" = 2;
      "fs.suid_dumpable" = false;
      "kernel.kptr_restrict" = 2;
      "kernel.sysrq" = false;
      "kernel.unprivileged_bpf_disabled" = 1;
      "kernel.unprivileged_userns_clone" = 1;

      "dev.tty.ldisk_autoload" = 0;
      "vm.unprivileged_userfaultfd" = 0;
      "kernel.kexec_load_disabled" = 1;
      "kernel.perf_event_paranoid" = 3;

      "net.core.bpf_jit_harden" = 2;

      "net.ipv4.conf.all.forwarding" = 0;
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;

      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;

      "net.ipv4.conf.all.log_martians" = true;
      "net.ipv4.conf.default.log_martians" = true;

      "net.ipv4.conf.all.rp_filter" = true;
      "net.ipv4.conf.all.send_redirects" = false;

      "net.ipv4.tcp_fastopen" = 3;
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
    };

    kernelParams = [
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=1"
      "nouveau.modeset=0"
    ];

    kernelPackages = pkgs.linuxPackages_hardened;

    kernelModules = [
      "kvm-amd"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];

    blacklistedKernelModules = [
      "dccp"
      "nouveau"
      "rds"
      "sctp"
      "tipc"
      "dccp"
      "sctp"
      "rds"
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

    extraModulePackages = [ ];
    supportedFilesystems = [
      "ntfs"
      "xfs"
    ];
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    cpu.amd.updateMicrocode = lib.mkDefault true;

    enableAllFirmware = true;

    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  services.hardware = {
    openrgb = {
      enable = true;
      package = pkgs.openrgb;
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/FB69-FC30";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/mapper/luks-e8eb023d-65f2-4922-9292-e8eaff31abcf";
      fsType = "xfs";
    };

    "/proc" = {
      device = "proc";
      fsType = "proc";
      options = [
        "defaults"
        "hidepid=2"
      ];
      neededForBoot = true;
    };

    "/run/media/nil/64603C01603BD88E" = {
      device = "/dev/disk/by-uuid/64603C01603BD88E";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
      ];
    };

    "/run/media/nil/7E7662DA766292A7" = {
      device = "/dev/disk/by-uuid/7E7662DA766292A7";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
      ];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/c809c2f4-c09c-4708-a82d-22eca5310c6d";
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
