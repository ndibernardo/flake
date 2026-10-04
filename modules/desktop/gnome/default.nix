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

      backgrounds = pkgs.runCommand "backgrounds" { } ''
        mkdir -p $out/share/backgrounds/flake $out/share/gnome-background-properties
        cp ${../../../configuration/wallpaper}/*.png $out/share/backgrounds/flake/
        cat > $out/share/gnome-background-properties/flake.xml <<EOF
        <?xml version="1.0"?>
        <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
        <wallpapers>
          <wallpaper deleted="false">
            <name>Dark</name>
            <filename>$out/share/backgrounds/flake/background-dark.png</filename>
            <options>zoom</options>
            <shade_type>solid</shade_type>
            <pcolor>#000000</pcolor>
            <scolor>#000000</scolor>
          </wallpaper>
          <wallpaper deleted="false">
            <name>Aqua</name>
            <filename>$out/share/backgrounds/flake/background-aqua.png</filename>
            <filename-dark>$out/share/backgrounds/flake/background-aqua-dark.png</filename-dark>
            <options>zoom</options>
            <shade_type>solid</shade_type>
            <pcolor>#000000</pcolor>
            <scolor>#000000</scolor>
          </wallpaper>
          <wallpaper deleted="false">
            <name>Platinum</name>
            <filename>$out/share/backgrounds/flake/background-platinum.png</filename>
            <filename-dark>$out/share/backgrounds/flake/background-platinum-dark.png</filename-dark>
            <options>zoom</options>
            <shade_type>solid</shade_type>
            <pcolor>#000000</pcolor>
            <scolor>#000000</scolor>
          </wallpaper>
        </wallpapers>
        EOF
      '';
    in
    {
      options.desktop.gnome.enable = lib.mkEnableOption "GNOME";

      config = lib.mkIf cfg.enable {
        core.audio.enable = true;
        core.fonts.enable = true;

        services.desktopManager.gnome.enable = true;
        services.displayManager.gdm.enable = true;
        services.gnome.core-developer-tools.enable = true;

        environment.gnome.excludePackages = with pkgs; [
          gnome-console
          gnome-tour
        ];

        environment.sessionVariables.NIXOS_OZONE_WL = lib.mkDefault "1";

        environment.systemPackages = with pkgs; [
          backgrounds
          gnome-tweaks
          gnomeExtensions.appindicator
          gnomeExtensions.dash-to-dock
          gnomeExtensions.just-perfection
          gnomeExtensions.pop-shell
          gnomeExtensions.space-bar
          gnomeExtensions.switcher
          gnomeExtensions.tophat
        ];

        programs.dconf.profiles.user.databases = [
          {
            settings."org/gnome/desktop/background" = {
              picture-options = "zoom";
              picture-uri = "file://${backgrounds}/share/backgrounds/flake/background-aqua.png";
              picture-uri-dark = "file://${backgrounds}/share/backgrounds/flake/background-aqua-dark.png";
              primary-color = "#000000";
            };
            settings."org/gnome/desktop/interface" = {
              accent-color = "teal";
              color-scheme = "prefer-dark";
              monospace-font-name = "Berkeley Mono 11";
            };
            settings."org/gnome/desktop/wm/keybindings" = {
              move-to-workspace-1 = [ "<Super><Shift>1" ];
              move-to-workspace-2 = [ "<Super><Shift>2" ];
              move-to-workspace-3 = [ "<Super><Shift>3" ];
              move-to-workspace-4 = [ "<Super><Shift>4" ];
              move-to-workspace-5 = [ "<Super><Shift>5" ];
              move-to-workspace-6 = [ "<Super><Shift>6" ];
              move-to-workspace-7 = [ "<Super><Shift>7" ];
              move-to-workspace-8 = [ "<Super><Shift>8" ];
              move-to-workspace-9 = [ "<Super><Shift>9" ];
              move-to-workspace-10 = [ "<Super><Shift>0" ];
              switch-to-workspace-1 = [ "<Super>1" ];
              switch-to-workspace-2 = [ "<Super>2" ];
              switch-to-workspace-3 = [ "<Super>3" ];
              switch-to-workspace-4 = [ "<Super>4" ];
              switch-to-workspace-down = [ "<Control><Alt>Down" ];
              switch-to-workspace-up = [ "<Control><Alt>Up" ];
            };
            settings."org/gnome/shell/keybindings" = lib.genAttrs (map (
              n: "switch-to-application-${toString n}"
            ) (lib.range 1 9)) (_: lib.gvariant.mkEmptyArray lib.gvariant.type.string);
            settings."org/gnome/shell/extensions/dash-to-dock" = {
              hot-keys = false;
            };
            settings."org/gnome/shell/extensions/pop-shell" = {
              active-hint-border-radius = lib.gvariant.mkUint32 5;
              hint-color-rgba = "rgba(1, 165, 158, 1)";
            };
            settings."org/gnome/shell/extensions/space-bar/shortcuts" = {
              enable-activate-workspace-shortcuts = true;
              enable-move-to-workspace-shortcuts = true;
            };
            settings."org/gnome/mutter" = {
              dynamic-workspaces = false;
              workspaces-only-on-primary = true;
              experimental-features = [
                "scale-monitor-framebuffer"
                "xwayland-native-scaling"
              ];
            };
          }
        ];
      };
    };
}
