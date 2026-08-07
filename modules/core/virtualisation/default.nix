{
  flake.nixosModules.core-virtualisation =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.core.virtualisation;
    in
    {
      options.core.virtualisation.enable = lib.mkEnableOption "libvirt and QEMU/KVM guests";

      config = lib.mkIf cfg.enable {
        virtualisation.libvirtd = {
          enable = true;

          onBoot = "ignore";
          onShutdown = "shutdown";

          qemu = {
            package = pkgs.qemu;

            # Guests run as qemu-libvirtd instead of root, so a qemu escape
            # lands on an unprivileged account. The cost is that disk images
            # must be readable by that user, i.e. kept under
            # /var/lib/libvirt/images rather than in a home directory.
            runAsRoot = false;
          };
        };

        # libvirtd asserts on this, and nothing else here guarantees it.
        security.polkit.enable = true;

        programs.virt-manager.enable = true;

        environment.systemPackages = with pkgs; [
          qemu
          virt-viewer

          # Verifies the signify(1) signatures OpenBSD publishes over its
          # release sets and install images.
          signify
        ];

        users.users = lib.mkIf config.core.users.enable {
          ${config.user.name}.extraGroups = [
            "kvm"
            "libvirtd"
          ];
        };
      };
    };
}
