{ ... }:
{
  flake.nixosModules.fail2ban = {
    services.fail2ban = {
      enable = true;
      maxretry = 10;
      bantime-increment.enable = true;
    };
  };
}
