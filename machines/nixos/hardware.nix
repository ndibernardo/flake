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
        "luks-1a9bbf8e-7008-42a2-8d61-dae96fe92d54" = {
          device = "/dev/disk/by-uuid/1a9bbf8e-7008-42a2-8d61-dae96fe92d54";
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
    ];
  };

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault true;
    enableAllFirmware = true;
    logitech.wireless.enable = true;
  };

  fileSystems."/" =
  { device = "/dev/mapper/luks-1a9bbf8e-7008-42a2-8d61-dae96fe92d54";
    fsType = "ext4";
  };
    
  fileSystems."/run/media/nil/64603C01603BD88E" = {
      device = "/dev/disk/by-uuid/64603C01603BD88E";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
      ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4D08-3849";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "25.11";
}
