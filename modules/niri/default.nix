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
      ];

      home-manager.users.${user.name} = {
        xdg.configFile."niri/config.kdl".source = ./configurations/niri/config.kdl;
        xdg.configFile."niri/.wallpaper".source = ./wallpaper/.wallpaper;

        home.sessionVariables = {
          BROWSER = "firefox";
          TERMINAL = "foot";
        };
      };
    }
  );
}
