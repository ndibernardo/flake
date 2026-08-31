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

        services.desktopManager.gnome.enable = true;

        # GDM replaces LightDM, which the X server module enables by default.
        services.displayManager.gdm = {
          enable = true;
          autoSuspend = false;
        };

        environment.systemPackages = with pkgs; [
          gnome-tweaks
          gnomeExtensions.appindicator
          gnomeExtensions.dash-to-dock
          gnomeExtensions.just-perfection
          gnomeExtensions.space-bar
          gnomeExtensions.switcher
          gnomeExtensions.tactile
          gnomeExtensions.tophat
        ];
      };
    };
}
