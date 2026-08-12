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
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      configurationLimit = 20;
    };

    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "sd_mod"
        "usb_storage"
        "usbhid"
        "xhci_pci"
      ];
      kernelModules = [ ];
      luks.devices = {
        "luks-${luksUuid}" = {
          device = "/dev/disk/by-uuid/${luksUuid}";
        };
      };
    };

    kernelParams = [
      # Graphics: nvidia KMS and fbdev, nouveau modesetting off.
      "nouveau.modeset=0"
      "nvidia-drm.fbdev=1"
      "nvidia-drm.modeset=1"

      # Wireless: no controller reset when the bluetooth device closes, no ASPM
      # on the mt7925e wifi card.
      "btmtk.reset_on_close=0"
      "mt7925e.disable_aspm=1"

      # Crash handling: panic on hung task, soft lockup and NMI, reboot 10s
      # later, keep the log across the reboot in EFI pstore.
      "hung_task_panic=1"
      "nmi_watchdog=panic,1"
      "panic=10"
      "pstore.backend=efi"
      "softlockup_panic=1"

      # Hardening: block PCI DMA before the IOMMU is up, randomize page
      # freelists, no slab cache merging.
      "efi=disable_early_pci_dma"
      "page_alloc.shuffle=1"
      "slab_nomerge"
    ];

    kernelModules = [
      "kvm-amd"
      "nvidia_drm"
      "nvidia_modeset"
      "nvidia_uvm"
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
    enableRedistributableFirmware = true;
    logitech.wireless.enable = true;
  };

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
    {
      device = "/dev/disk/by-partuuid/527b6b83-5242-4417-ba3d-8880ce255e80";
      randomEncryption.enable = true;
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "25.11";
}
