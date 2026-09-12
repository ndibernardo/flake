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
        desktop.fuzzel.enable = lib.mkDefault true;

        programs.niri.enable = true;
        programs.fish.loginShellInit = lib.mkAfter ''
          if test "$XDG_VTNR" = 1; and not set -q WAYLAND_DISPLAY
            exec ${config.programs.niri.package}/bin/niri-session -l
          end
        '';
        programs.xwayland.enable = true;

        environment.systemPackages = with pkgs; [
          brightnessctl
          playerctl
          swaybg
          swaylock
          wl-clipboard
          xwayland-satellite
        ];

        environment.sessionVariables.NIXOS_OZONE_WL = "1";

        security.pam.services.swaylock = { };

        xdg.portal = {
          enable = true;
          extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
        };

        core.dotfiles.directories = [ ".config/niri" ];
        core.dotfiles.links.".config/niri/config.kdl" = lib.mkDefault "niri/config.kdl";
      };
    };
}
