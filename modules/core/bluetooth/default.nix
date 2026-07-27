{
  flake.nixosModules.core-bluetooth =
    { config, lib, ... }:
    let
      cfg = config.core.bluetooth;
    in
    {
      options.core.bluetooth.enable = lib.mkEnableOption "Bluetooth support";

      config = lib.mkIf cfg.enable {
        hardware.bluetooth = {
          enable = true;
          powerOnBoot = true;
        };
      };
    };
}
