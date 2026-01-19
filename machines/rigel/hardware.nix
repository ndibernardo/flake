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
        "luks-2a87686a-00bc-4ca7-82a7-a08f31de13e9" = {
          device = "/dev/disk/by-uuid/2a87686a-00bc-4ca7-82a7-a08f31de13e9";
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

    kernelPackages = pkgs.linuxPackages_latest;

    blacklistedKernelModules = [ "nouveau" ];
    extraModulePackages = [ ];
    supportedFilesystems = [
      "ntfs"
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
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  # Use a newer version of OpenRGB
  services.hardware = {
    openrgb = {
      enable = true;
      package = pkgs.openrgb;
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/D152-C017";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/mapper/luks-2a87686a-00bc-4ca7-82a7-a08f31de13e9";
      fsType = "ext4";
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
      device = "/dev/disk/by-uuid/8473236f-47c8-4903-a4ad-53f0cccb17fc";
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
