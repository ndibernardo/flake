{
  flake.nixosModules.desktop-stumpwm =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.stumpwm;

      background = "#16161D";

      display = {
        output = "DP-4";
        mode = "3840x2160";
        rate = "240.02";
      };

      fontDir = "/run/current-system/sw/share/X11/fonts";

      i3lock = lib.getExe' config.programs.i3lock.package "i3lock";
      xrandr = lib.getExe' pkgs.xrandr "xrandr";
      xrdb = lib.getExe' pkgs.xrdb "xrdb";
      xset = lib.getExe' pkgs.xset "xset";
      xsetroot = lib.getExe' pkgs.xsetroot "xsetroot";
      xssLock = lib.getExe' pkgs.xss-lock "xss-lock";
    in
    {
      options.desktop.stumpwm.enable = lib.mkEnableOption "StumpWM";

      config = lib.mkIf cfg.enable {
        core.audio.enable = true;
        core.fonts.enable = true;
        core.dotfiles.enable = true;
        applications.alacritty.enable = true;

        services.xserver = {
          enable = true;
          fontPath = lib.mkDefault fontDir;
          windowManager.stumpwm.enable = true;

          displayManager.sessionCommands = ''
            if [ -n "$DISPLAY" ]; then
              ${xrandr} --output ${display.output} \
                --mode ${display.mode} --rate ${display.rate} || true

              printf 'Xft.dpi: 96\n' | ${xrdb} -merge -
              ${xsetroot} -solid '${background}' -cursor_name left_ptr
              ${xset} s 1800 1800
              ${xset} dpms 0 0 2400
              ${xssLock} --transfer-sleep-lock -- ${i3lock} -n -c 16161d &
            fi
          '';
        };

        programs.i3lock.enable = true;
        services.gnome.gnome-keyring.enable = true;

        xdg.portal = {
          enable = true;
          extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
        };

        environment.systemPackages = [
          pkgs.brightnessctl
          pkgs.iw
          pkgs.maim
          pkgs.stumpwm-contrib
          pkgs.xclip
          pkgs.xrandr
          pkgs.xrdb
          pkgs.xset
          pkgs.xsetroot
          pkgs.xss-lock
        ];
        environment.pathsToLink = [ "/share/stumpwm-contrib" ];

        core.dotfiles.directories = [ ".stumpwm.d" ];
        core.dotfiles.links.".stumpwm.d/init.lisp" = lib.mkDefault "stumpwm/init.lisp";
      };
    };
}
