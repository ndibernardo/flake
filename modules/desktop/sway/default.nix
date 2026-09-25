{
  flake.nixosModules.desktop-sway =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.sway;
    in
    {
      options.desktop.sway.enable = lib.mkEnableOption "Sway";

      config = lib.mkIf cfg.enable {
        # The keybindings call pactl, which pipewire's pulse support puts on PATH.
        core.audio.enable = true;
        core.dotfiles.enable = true;
        desktop.fuzzel.enable = true;
        applications.foot.enable = true;

        programs.sway = {
          enable = true;
          wrapperFeatures = {
            base = true;
            gtk = true;
          };
          extraOptions = [ "--unsupported-gpu" ];
        };

        security.pam.services.sway.enableGnomeKeyring = true;
        services.gnome.gnome-keyring.enable = true;

        xdg.portal = {
          enable = true;
          extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
          wlr.enable = true;
        };

        # The sway configuration names these by bare command.
        environment.systemPackages = [
          pkgs.brightnessctl
          pkgs.glib
          pkgs.grim
          pkgs.i3status
          pkgs.swaybg
          pkgs.swayidle
          pkgs.swaylock
          pkgs.wl-clipboard
        ];

        core.dotfiles.directories = [
          ".config/i3status"
          ".config/sway"
        ];
        core.dotfiles.links = {
          ".config/i3status/config" = lib.mkDefault "i3status/config";
          ".config/sway/config" = lib.mkDefault "sway/config";
        };
      };
    };
}
