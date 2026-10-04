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
        core.audio.enable = true;
        core.dotfiles.enable = true;
        core.fonts.enable = true;
        applications.alacritty.enable = true;

        programs.sway = {
          enable = true;
          wrapperFeatures = {
            base = true;
            gtk = true;
          };
          extraOptions = [ "--unsupported-gpu" ];
        };

        environment.sessionVariables.NIXOS_OZONE_WL = lib.mkDefault "1";

        security.pam.services.sway.enableGnomeKeyring = true;
        services.gnome.gnome-keyring.enable = true;

        xdg.portal = {
          enable = true;
          extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
          wlr.enable = true;
        };

        programs.thunar = {
          enable = true;
          plugins = with pkgs; [
            thunar-archive-plugin
            thunar-media-tags-plugin
            thunar-shares-plugin
            thunar-vcs-plugin
            thunar-volman
          ];
        };
        services.blueman.enable = config.core.bluetooth.enable;
        services.gvfs.enable = true;
        services.tumbler.enable = true;

        environment.systemPackages = with pkgs; [
          bemenu
          brightnessctl
          grim
          pavucontrol
          slurp
          swaybg
          swayidle
          swaylock
          waybar
          wl-clipboard
          xarchiver
        ];

        core.dotfiles.directories = [
          ".config/sway"
          ".config/waybar"
        ];
        core.dotfiles.links = {
          ".config/sway/background.png" = lib.mkDefault "wallpaper/background-aqua-dark.png";
          ".config/sway/config" = lib.mkDefault "sway/config";
          ".config/waybar/config.jsonc" = lib.mkDefault "waybar/config.jsonc";
          ".config/waybar/style.css" = lib.mkDefault "waybar/style.css";
        };
      };
    };
}
