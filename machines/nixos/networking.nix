{ lib, ... }:
{
  networking = {
    hostName = "nixos";
    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ];
    };
    networkmanager.enable = true;
    nftables.enable = true;
    useDHCP = lib.mkDefault true;
  };
}
