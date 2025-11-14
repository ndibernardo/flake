{ config, lib, ... }:

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
        "luks-41a2b634-9f1b-46c0-a307-b45cf7acaf30" = {
          device = "/dev/disk/by-uuid/41a2b634-9f1b-46c0-a307-b45cf7acaf30";
        };
      };
    };

    kernelParams = [
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

    blacklistedKernelModules = [ "nouveau" ];
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
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/89F2-8922";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/b192171b-8fb1-4b75-ad8d-032edcaca0d3";
      fsType = "xfs";
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
      device = "/dev/disk/by-uuid/d57bb2a6-87b9-424e-a363-362b6283042a";
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
