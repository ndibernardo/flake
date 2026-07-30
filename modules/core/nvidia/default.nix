{
  flake.nixosModules.core-nvidia =
    { config, lib, ... }:
    let
      cfg = config.core.nvidia;
    in
    {
      options.core.nvidia.enable = lib.mkEnableOption "NVIDIA";

      config = lib.mkIf cfg.enable {
        core.nixpkgs.enable = true;
        core.nixpkgs.unfreePackages = [
          "nvidia-x11"
          "nvidia-settings"
          "nvidia-persistenced"
        ];

        hardware = {
          graphics = {
            enable = true;
            enable32Bit = true;
          };
          nvidia = {
            branch = "latest";
            modesetting.enable = true;
            nvidiaSettings = true;
            open = true;
          };
        };

        services.xserver = {
          enable = true;
          videoDrivers = [ "nvidia" ];
        };
        environment.variables = {
          LIBVA_DRIVER_NAME = "nvidia";
          GBM_BACKEND = "nvidia-drm";
          __GLX_VENDOR_LIBRARY_NAME = "nvidia";
          XDG_SESSION_TYPE = "wayland";
        };
      };
    };
}
