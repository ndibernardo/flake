{ ... }:
{
  flake.nixosModules.labwc = (
    {
      pkgs,
      lib,
      user,
      ...
    }:
    {
      programs.labwc.enable = true;

      environment.systemPackages = [
        pkgs.hypridle
        pkgs.swaylock-effects
        pkgs.wlopm
        pkgs.grim
        pkgs.slurp
        pkgs.swaybg
        pkgs.sfwbar
        pkgs.networkmanagerapplet
      ];

      home-manager.users.${user.name} = {
        xdg.configFile."labwc/autostart" = {
          executable = true;
          source = ./configurations/autostart;
        };

        xdg.configFile."labwc/environment".source = ./configurations/environment;

        xdg.configFile."hypr/hypridle.conf".source = ./configurations/hypridle.conf;

        xdg.configFile."labwc/rc.xml".source = ./configurations/rc.xml;

        xdg.configFile."labwc/menu.xml".source = ./configurations/menu.xml;

        xdg.configFile."sfwbar/sfwbar.config".source = ./configurations/sfwbar.config;

        xdg.configFile."sfwbar/showdesktop.widget".source = ./configurations/showdesktop.widget;
      };

      xdg.portal.config.labwc = {
        default = lib.mkForce [
          "wlr"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
      };
    }
  );
}
