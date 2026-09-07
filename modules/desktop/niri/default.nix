{
  flake.nixosModules.desktop-niri =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.niri;
    in
    {
      options.desktop.niri.enable = lib.mkEnableOption "niri";

      config = lib.mkIf cfg.enable {
        core.audio.enable = true;
        core.dotfiles.enable = true;
        core.fonts.enable = true;
        desktop.noctalia.enable = lib.mkDefault true;

        programs.niri.enable = true;
        programs.xwayland.enable = true;

        environment.systemPackages = with pkgs; [
          brightnessctl
          playerctl
          swaybg
          wl-clipboard
          xwayland-satellite
        ];

        environment.sessionVariables.NIXOS_OZONE_WL = "1";

        xdg.portal = {
          enable = true;
          extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
        };

        core.dotfiles.directories = [ ".config/niri" ];
        core.dotfiles.links.".config/niri/config.kdl" = lib.mkDefault "niri/config.kdl";
      };
    };
}
