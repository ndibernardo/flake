{
  config,
  pkgs,
  lib,
  ...
}:

let
  luksUuid = "b9746794-54bd-45d0-a2aa-e672f9fb6415";
in
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
        "luks-${luksUuid}" = {
          device = "/dev/disk/by-uuid/${luksUuid}";
        };
      };
    };

    kernelParams = [
      "btmtk.reset_on_close=0"
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=1"
      "nouveau.modeset=0"
      "pstore.backend=efi"
      "softlockup_panic=1"
      "hung_task_panic=1"
      "nmi_watchdog=panic,1"
      "panic=10"
      "mt7925e.disable_aspm=1"
    ];

    kernelModules = [
      "kvm-amd"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];

    kernelPackages = pkgs.linuxPackages_latest;

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

  # enableAllFirmware above pulls in redistributable-but-unfree blobs
  core.nixpkgs.unfreePackages = [
    "b43-firmware"
    "broadcom-bt-firmware"
    "facetimehd-calibration"
    "facetimehd-firmware"
    "xone-dongle-firmware"
    "xow_dongle-firmware"
  ];

  fileSystems."/" = {
    device = "/dev/mapper/luks-${luksUuid}";
    fsType = "xfs";
  };

  fileSystems."/run/media/nil/64603C01603BD88E" = {
    device = "/dev/disk/by-uuid/64603C01603BD88E";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=${toString config.users.users.${config.user.name}.uid}"
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
    { device = "/dev/disk/by-uuid/2ec1fa8f-6885-424e-8cb3-c0fa5f01cbd8"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "25.11";
}
