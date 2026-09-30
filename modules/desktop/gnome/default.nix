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
            };
            settings."org/gnome/shell/extensions/pop-shell" = {
              hint-color-rgba = "rgba(1, 165, 158, 1)";
            };
            settings."org/gnome/mutter" = {
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
