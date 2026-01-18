{ pkgs, ... }:

{
  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  services.displayManager.ly.enable = true;
  services.dbus.enable = true;
  security.pam.services.sway.enableGnomeKeyring = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
  };

  environment.systemPackages = with pkgs; [
    thunar
    xdg-utils
  ];
}
