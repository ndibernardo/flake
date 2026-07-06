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
        pkgs.swayidle
        pkgs.swaylock
        pkgs.grim
        pkgs.slurp
        pkgs.swaybg
        pkgs.networkmanagerapplet
      ];

      home-manager.users.${user.name} =
        let
          waybarLib = import ../waybar/_lib.nix { inherit pkgs user; };
          waybar = waybarLib.mkWaybar {
            left = [
              "ext/workspaces"
              "wlr/taskbar"
            ];
            right = [
              "pulseaudio"
              "network"
              "tray"
              "clock"
            ];
          };
        in
        {
          xdg.configFile."labwc/autostart" = {
            executable = true;
            source = ./configurations/autostart;
          };

          xdg.configFile."labwc/environment".source = ./configurations/environment;

          xdg.configFile."labwc/rc.xml".source = ./configurations/rc.xml;

          xdg.configFile."labwc/menu.xml".source = ./configurations/menu.xml;

          xdg.configFile."waybar/config-labwc".text = builtins.toJSON waybar.settings;

          xdg.configFile."waybar/style-labwc.css".text = waybar.style;
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
