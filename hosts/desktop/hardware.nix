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
        "luks-8b8ce19c-c88f-40c6-b0b3-e85983a240db" = {
          device = "/dev/disk/by-uuid/8b8ce19c-c88f-40c6-b0b3-e85983a240db";
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
      device = "/dev/disk/by-uuid/F58F-2101";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/efa8be3f-ebac-4e53-a976-dcfb3f9c2bd0";
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
      device = "/dev/disk/by-uuid/eed577d5-8450-4f50-909d-2ff7301ff5e2";
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
