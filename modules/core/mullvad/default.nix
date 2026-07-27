{
  flake.nixosModules.core-mullvad =
    {
      config,
      lib,
      ...
    }:
    let
      cfg = config.core.mullvad;
    in
    {
      options.core.mullvad.enable = lib.mkEnableOption "Mullvad";

      config = lib.mkIf cfg.enable {
        services.mullvad-vpn = {
          enable = true;
          gui.enable = true;
        };
      };
    };
}
