{ ... }:
{
  flake.nixosModules.niri = (
    { pkgs, user, ... }:
    {
      programs.niri.enable = true;
      programs.xwayland.enable = true;

      environment.systemPackages = with pkgs; [
        niri
        xwayland-satellite
        swaybg
        noctalia-shell
        xdg-desktop-portal-gtk
      ];

      home-manager.users.${user.name} = {
        xdg.configFile."niri/config.kdl".source = ./configurations/niri/config.kdl;

        home.sessionVariables = {
          BROWSER = "firefox";
          TERMINAL = "ghostty";
        };
      };
    }
  );
}
