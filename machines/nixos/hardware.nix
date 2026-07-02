{
  pkgs,
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
        "luks-ef82c6d2-582c-48bd-aedf-5e4bccc9b8f7" = {
          device = "/dev/disk/by-uuid/ef82c6d2-582c-48bd-aedf-5e4bccc9b8f7";
        };
      };
    };

    kernelParams = [
      "btmtk.reset_on_close=0"
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=1"
      "nouveau.modeset=0"
    ];

    kernelModules = [
      "kvm-amd"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];

    kernelPackages = pkgs.linuxPackages_latest;

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

    extraModulePackages = [ ];
    supportedFilesystems = [
      "ntfs"
      "xfs"
    ];
  };

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault true;
    enableAllFirmware = true;
    logitech.wireless.enable = true;
  };

  fileSystems."/" = {
    device = "/dev/mapper/luks-ef82c6d2-582c-48bd-aedf-5e4bccc9b8f7";
    fsType = "xfs";
  };

  fileSystems."/run/media/nil/64603C01603BD88E" = {
    device = "/dev/disk/by-uuid/64603C01603BD88E";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };

  fileSystems."/run/media/nil/f2b3330c-05ee-4f7e-ac85-bf7c239faeb8" = {
    device = "/dev/disk/by-uuid/f2b3330c-05ee-4f7e-ac85-bf7c239faeb8";
    fsType = "ext4";
    options = [
      "rw"
      "users"
      "exec"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/A743-0820";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/80a785cd-9589-4e8e-972a-0091f230e5f2"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "25.11";
}
