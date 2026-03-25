{ lib, ... }:
{
  networking = {
    hostName = "wintermute";
    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ];
    };
    networkmanager.enable = true;
    nftables.enable = true;
    useDHCP = lib.mkDefault true;
  };
}
