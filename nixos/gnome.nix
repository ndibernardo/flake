{ pkgs, ... }:

{
  services.displayManager = {
    gdm = {
      enable = true;
      autoSuspend = false;
      wayland = true;
    };
  };

  services.desktopManager = {
    gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
    gnomeExtensions.space-bar
    gnomeExtensions.switcher
    gnomeExtensions.tactile
    gnomeExtensions.tophat
    gnome-tweaks
  ];

  services.udev.packages = with pkgs; [
    gnome-settings-daemon
  ];

  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };
}
