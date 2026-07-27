{
  flake.nixosModules.core-journald =
    { config, lib, ... }:
    let
      cfg = config.core.journald;
    in
    {
      options.core.journald.enable = lib.mkEnableOption "journald storage and retention policy";

      config = lib.mkIf cfg.enable {
        services.journald = {
          extraConfig = ''
            SyncIntervalSec=30
            SystemMaxUse=500M
            SystemMaxFileSize=50M
          '';
          storage = "volatile";
          upload.enable = false;
        };
      };
    };
}
