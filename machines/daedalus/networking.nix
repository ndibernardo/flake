{ lib, ... }:
{
  networking = {
    firewall.enable = true;
    networkmanager = {
      enable = true;
      wifi.macAddress = "stable";
    };
    nftables.enable = true;
    useDHCP = lib.mkDefault true;
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSOverTLS = "yes";
      FallbackDNS = [ ];
    };
  };
  networking.nameservers = [ "194.242.2.2#dns.mullvad.net" ];
}
