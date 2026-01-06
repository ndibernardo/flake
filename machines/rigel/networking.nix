{ lib, ... }:
{
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.mtr.enable = true;

  networking = {
    hostName = "rigel";

    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ];
      allowedTCPPorts = [
        2234
        5001
      ];
    };

    networkmanager = {
      enable = true;
    };

    nftables = {
      enable = true;
    };

    useDHCP = lib.mkDefault true;
  };

  services = {
    fail2ban = {
      enable = true;
      maxretry = 10;
      bantime-increment.enable = true;
    };

    mullvad-vpn = {
      enable = true;
    };

    tailscale = {
      enable = true;
    };
  };
}
