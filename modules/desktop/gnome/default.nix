{
  flake.nixosModules.desktop-gnome =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.gnome;
    in
    {
      options.desktop.gnome.enable = lib.mkEnableOption "GNOME";

      config = lib.mkIf cfg.enable {
        core.audio.enable = true;
        core.fonts.enable = true;
        desktop.gdm.enable = true;

        services.desktopManager.gnome.enable = true;
        services.gnome.core-developer-tools.enable = true;

        environment.sessionVariables.NIXOS_OZONE_WL = lib.mkDefault "1";

        environment.systemPackages = with pkgs; [
          gnome-tweaks
          gnomeExtensions.appindicator
          gnomeExtensions.dash-to-dock
          gnomeExtensions.just-perfection
          gnomeExtensions.pop-shell
          gnomeExtensions.space-bar
          gnomeExtensions.switcher
          gnomeExtensions.tophat
        ];
      };
    };
}
