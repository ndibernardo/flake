{ lib, ... }:
{
  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
    nftables.enable = true;
    useDHCP = lib.mkDefault true;
  };
}
