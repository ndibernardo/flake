{ ... }:
{
  flake.nixosModules.theme = (
    {
      pkgs,
      lib,
      user,
      ...
    }:
    let
      stateDir = "${user.homeDirectory}/.local/state/theme";

      palettes = {
        dark = {
          bg = "#1d1f21";
          fg = "#c5c8c6";
          muted = "#969896";
          selection = "#373b41";
          borderInactive = "#373b41";
          borderUnfocused = "#282a2e";
          fuzzelBorder = "#282a2e";
          accent = "#81a2be";
          accentAlt = "#8abeb7";
          urgent = "#cc6666";
          good = "#b5bd68";
          wallpaper = "#545454";
          focusedBorder = "#a9a9a9";
          borderWidth = 2;
        };
        light = {
          bg = "#ffffff";
          fg = "#4d4d4c";
          muted = "#8e908c";
          selection = "#d6d6d6";
          borderInactive = "#8e908c";
          borderUnfocused = "#d6d6d6";
          fuzzelBorder = "#8e908c";
          accent = "#4271ae";
          accentAlt = "#3e999f";
          urgent = "#c82829";
          good = "#718c00";
          wallpaper = "#545454";
          focusedBorder = "#4271ae";
          borderWidth = 4;
        };
      };

      swayColors =
        focusedBorder: borderWidth:
        let
          p = palettes.dark;
        in
        ''
          client.focused ${focusedBorder} ${p.wallpaper} ${p.fg} ${focusedBorder} ${focusedBorder}
          client.focused_inactive ${p.wallpaper} ${p.wallpaper} ${p.muted} ${p.wallpaper} ${p.wallpaper}
          client.unfocused ${p.wallpaper} ${p.wallpaper} ${p.muted} ${p.wallpaper} ${p.wallpaper}
          client.urgent ${p.urgent} ${p.wallpaper} ${p.fg} ${p.urgent} ${p.urgent}
          client.placeholder ${p.wallpaper} ${p.wallpaper} ${p.muted} ${p.wallpaper} ${p.wallpaper}
          default_border pixel ${toString borderWidth}
          default_floating_border pixel ${toString borderWidth}
          output * bg ${p.wallpaper} solid_color
        '';

      waybarColors = p: ''
        @define-color bg ${p.bg};
        @define-color fg ${p.fg};
        @define-color muted ${p.muted};
        @define-color urgent ${p.urgent};
        @define-color good ${p.good};
        @define-color accent ${p.accent};
      '';

      fuzzelColors =
        p:
        let
          strip = c: builtins.substring 1 6 c;
        in
        ''
          [colors]
          background=${strip p.bg}ff
          text=${strip p.fg}ff
          match=${strip p.accent}ff
          selection=${strip p.selection}ff
          selection-text=${strip p.fg}ff
          selection-match=${strip p.accent}ff
          border=${strip p.fuzzelBorder}ff
        '';

      labwcTheme = {
        light = ''
          border.width: 1
          padding.width: 6
          padding.height: 4

          window.active.border.color: #c0bfbc
          window.active.title.bg.color: #deddda
          window.active.title.bg.type: Solid
          window.active.label.text.color: #1d1d1d
          window.active.button.unpressed.bg.color: #deddda
          window.active.button.unpressed.bg.type: Solid
          window.active.button.unpressed.image.color: #5d5d5d
          window.active.button.pressed.bg.color: #b6b5b2
          window.active.button.pressed.bg.type: Solid
          window.active.button.pressed.image.color: #1d1d1d
          window.active.button.hover.bg.color: #c8c7c4
          window.active.button.hover.bg.type: Solid
          window.active.button.hover.image.color: #1d1d1d
          window.active.handle.bg.color: #deddda
          window.active.handle.bg.type: Solid
          window.active.grip.bg.color: #c0bfbc
          window.active.grip.bg.type: Solid

          window.inactive.border.color: #d3d2d0
          window.inactive.title.bg.color: #f0efed
          window.inactive.title.bg.type: Solid
          window.inactive.label.text.color: #7a7a7a
          window.inactive.button.unpressed.bg.color: #f0efed
          window.inactive.button.unpressed.bg.type: Solid
          window.inactive.button.unpressed.image.color: #9a9a9a
          window.inactive.button.hover.bg.color: #deddda
          window.inactive.button.hover.bg.type: Solid
          window.inactive.button.hover.image.color: #7a7a7a
          window.inactive.handle.bg.color: #f0efed
          window.inactive.handle.bg.type: Solid
          window.inactive.grip.bg.color: #d3d2d0
          window.inactive.grip.bg.type: Solid

          menu.bg.color: #f6f5f4
          menu.bg.type: Solid
          menu.border.color: #c0bfbc
          menu.border.width: 1
          menu.items.bg.color: #f6f5f4
          menu.items.bg.type: Solid
          menu.items.text.color: #1d1d1d
          menu.items.disabled.text.color: #9a9a9a
          menu.items.active.bg.color: #3584e4
          menu.items.active.bg.type: Solid
          menu.items.active.text.color: #ffffff
          menu.title.bg.color: #deddda
          menu.title.bg.type: Solid
          menu.title.text.color: #1d1d1d

          osd.bg.color: #1d1d1d
          osd.bg.type: Solid
          osd.border.color: #0d0d0d
          osd.border.width: 1
          osd.label.text.color: #ffffff
        '';
        dark = ''
          border.width: 1
          padding.width: 6
          padding.height: 4

          window.active.border.color: #1e1e1e
          window.active.title.bg.color: #363636
          window.active.title.bg.type: Solid
          window.active.label.text.color: #ffffff
          window.active.button.unpressed.bg.color: #363636
          window.active.button.unpressed.bg.type: Solid
          window.active.button.unpressed.image.color: #d4d4d4
          window.active.button.pressed.bg.color: #2b2b2b
          window.active.button.pressed.bg.type: Solid
          window.active.button.pressed.image.color: #ffffff
          window.active.button.hover.bg.color: #464646
          window.active.button.hover.bg.type: Solid
          window.active.button.hover.image.color: #ffffff
          window.active.handle.bg.color: #363636
          window.active.handle.bg.type: Solid
          window.active.grip.bg.color: #1e1e1e
          window.active.grip.bg.type: Solid

          window.inactive.border.color: #2a2a2a
          window.inactive.title.bg.color: #2b2b2b
          window.inactive.title.bg.type: Solid
          window.inactive.label.text.color: #6c6c6c
          window.inactive.button.unpressed.bg.color: #2b2b2b
          window.inactive.button.unpressed.bg.type: Solid
          window.inactive.button.unpressed.image.color: #6c6c6c
          window.inactive.button.hover.bg.color: #363636
          window.inactive.button.hover.bg.type: Solid
          window.inactive.button.hover.image.color: #6c6c6c
          window.inactive.handle.bg.color: #2b2b2b
          window.inactive.handle.bg.type: Solid
          window.inactive.grip.bg.color: #2a2a2a
          window.inactive.grip.bg.type: Solid

          menu.bg.color: #303030
          menu.bg.type: Solid
          menu.border.color: #1a1a1a
          menu.border.width: 1
          menu.items.bg.color: #303030
          menu.items.bg.type: Solid
          menu.items.text.color: #e5e5e5
          menu.items.disabled.text.color: #6c6c6c
          menu.items.active.bg.color: #3584e4
          menu.items.active.bg.type: Solid
          menu.items.active.text.color: #ffffff
          menu.title.bg.color: #3d3d3d
          menu.title.bg.type: Solid
          menu.title.text.color: #ffffff

          osd.bg.color: #1d1d1d
          osd.bg.type: Solid
          osd.border.color: #0d0d0d
          osd.border.width: 1
          osd.label.text.color: #ffffff
        '';
      };

      files = lib.mapAttrs (mode: p: {
        sway = pkgs.writeText "sway-colors-${mode}" (swayColors p.focusedBorder p.borderWidth);
        waybar = pkgs.writeText "waybar-colors-${mode}.css" (waybarColors p);
        fuzzel = pkgs.writeText "fuzzel-colors-${mode}.ini" (fuzzelColors p);
        labwc = pkgs.writeText "labwc-themerc-${mode}" labwcTheme.${mode};
      }) palettes;

      theme-apply = pkgs.writeShellScriptBin "theme-apply" ''
        state="${stateDir}"
        mkdir -p "$state"

        mode="''${1:-}"
        if [ -z "$mode" ] && [ -f "$state/mode" ]; then
          mode="$(cat "$state/mode")"
        fi
        [ "$mode" = light ] || mode=dark

        install -m 644 ${files.dark.waybar} "$state/waybar-colors.css"
        swaybg_color=${palettes.dark.wallpaper}

        if [ "$mode" = light ]; then
          install -m 644 ${files.light.sway} "$state/sway-colors"
          install -m 644 ${files.light.fuzzel} "$state/fuzzel-colors.ini"
          labwc_themerc=${files.light.labwc}
          scheme=prefer-light
          gtk_theme=Adwaita
          border_width=${toString palettes.light.borderWidth}
        else
          install -m 644 ${files.dark.sway} "$state/sway-colors"
          install -m 644 ${files.dark.fuzzel} "$state/fuzzel-colors.ini"
          labwc_themerc=${files.dark.labwc}
          scheme=prefer-dark
          gtk_theme=Adwaita-dark
          border_width=${toString palettes.dark.borderWidth}
        fi
        printf '%s\n' "$mode" > "$state/mode"

        ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'$scheme'"
        ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'$gtk_theme'"

        if [ -n "''${SWAYSOCK:-}" ]; then
          swaymsg reload >/dev/null 2>&1 || true
          ${pkgs.sway}/bin/swaymsg -t get_tree | ${pkgs.jq}/bin/jq -r '.. | objects | select(.pid != null) | .id' | while read -r id; do
            ${pkgs.sway}/bin/swaymsg "[con_id=$id] border pixel $border_width" >/dev/null 2>&1 || true
          done
        fi

        # waybar's process name is .waybar-wrapped, so no -x here
        ${pkgs.procps}/bin/pkill -USR2 waybar 2>/dev/null || true

        labwc_theme="${user.homeDirectory}/.local/share/themes/adwaita-labwc/openbox-3"
        mkdir -p "$labwc_theme"
        install -m 644 "$labwc_themerc" "$labwc_theme/themerc"
        if ${pkgs.procps}/bin/pgrep -x labwc >/dev/null 2>&1; then
          ${pkgs.labwc}/bin/labwc --reconfigure >/dev/null 2>&1 || true
          ${pkgs.procps}/bin/pkill -x swaybg 2>/dev/null || true
          ${pkgs.swaybg}/bin/swaybg -c "$swaybg_color" &
        fi

        if command -v nvim >/dev/null 2>&1; then
          for sock in "''${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"/nvim.*.0; do
            [ -S "$sock" ] || continue
            nvim --server "$sock" --remote-expr "v:lua.set_theme_mode('$mode')" >/dev/null 2>&1 || true
          done
        fi
      '';

      theme-toggle = pkgs.writeShellScriptBin "theme-toggle" ''
        mode="$(cat "${stateDir}/mode" 2>/dev/null || echo dark)"
        if [ "$mode" = dark ]; then
          exec ${theme-apply}/bin/theme-apply light
        else
          exec ${theme-apply}/bin/theme-apply dark
        fi
      '';
    in
    {
      environment.systemPackages = [
        theme-apply
        theme-toggle
      ];

      home-manager.users.${user.name} = (
        { lib, ... }:
        {
          home.activation.themeSeed = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            if [ ! -f "${stateDir}/mode" ]; then
              run ${theme-apply}/bin/theme-apply dark
            fi
          '';
        }
      );
    }
  );
}
