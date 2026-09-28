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
        desktop.gdm.enable = true;
        desktop.noctalia.enable = lib.mkDefault true;

        programs.niri.enable = true;
        environment.sessionVariables.NIXOS_OZONE_WL = lib.mkDefault "1";

        environment.systemPackages = with pkgs; [
          wl-clipboard
          xwayland-satellite
        ];

        xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

        core.dotfiles.directories = [ ".config/niri" ];
        core.dotfiles.links.".config/niri/config.kdl" = lib.mkDefault "niri/config.kdl";
      };
    };
}
