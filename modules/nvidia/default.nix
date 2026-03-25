{ ... }:
{
  flake.nixosModules.nvidia = (
    { config, ... }:
    {
      hardware = {
        graphics.enable = true;
        nvidia = {
          modesetting.enable = true;
          nvidiaSettings = true;
          open = true;
          package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
      };

      services.xserver = {
        enable = true;
        videoDrivers = [ "nvidia" ];
      };
    }
  );
}
