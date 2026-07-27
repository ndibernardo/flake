{
  flake.nixosModules.core-fail2ban =
    { config, lib, ... }:
    let
      cfg = config.core.fail2ban;
    in
    {
      options.core.fail2ban.enable = lib.mkEnableOption "fail2ban";

      config = lib.mkIf cfg.enable {
        services.fail2ban = {
          enable = true;
          maxretry = 10;
          bantime-increment.enable = true;
        };
      };
    };
}
