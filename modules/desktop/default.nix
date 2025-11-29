{ pkgs, ... }:

{
  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  services.dbus.enable = true;

  # Enable gnome-keyring for NetworkManager password storage
  services.gnome.gnome-keyring.enable = true;

  # Auto-unlock keyring at Sway login
  security.pam.services.sway.enableGnomeKeyring = true;

  # Ly display manager
  services.displayManager.ly.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Sway is now configured via home-manager
  # Enable sway at system level for session management
  programs.sway = {
    enable = true;
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
  };

  # Install system-level utilities
  environment.systemPackages = with pkgs; [
    xfce.thunar
    xdg-utils
  ];
}
