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
        };
      };

      swayColors = p: ''
        client.focused ${p.accent} ${p.bg} ${p.fg} ${p.accent} ${p.accent}
        client.focused_inactive ${p.borderInactive} ${p.bg} ${p.muted} ${p.borderInactive} ${p.borderInactive}
        client.unfocused ${p.borderUnfocused} ${p.bg} ${p.muted} ${p.borderUnfocused} ${p.borderUnfocused}
        client.urgent ${p.urgent} ${p.bg} ${p.fg} ${p.urgent} ${p.urgent}
        client.placeholder ${p.bg} ${p.bg} ${p.muted} ${p.bg} ${p.bg}
        output * bg ${p.bg} solid_color
      '';

      waybarColors = p: ''
        @define-color bg ${p.bg};
        @define-color fg ${p.fg};
        @define-color muted ${p.muted};
        @define-color accent ${p.accent};
        @define-color accent_alt ${p.accentAlt};
        @define-color urgent ${p.urgent};
        @define-color good ${p.good};
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

      files = lib.mapAttrs (mode: p: {
        sway = pkgs.writeText "sway-colors-${mode}" (swayColors p);
        waybar = pkgs.writeText "waybar-colors-${mode}.css" (waybarColors p);
        fuzzel = pkgs.writeText "fuzzel-colors-${mode}.ini" (fuzzelColors p);
      }) palettes;

      theme-apply = pkgs.writeShellScriptBin "theme-apply" ''
        state="${stateDir}"
        mkdir -p "$state"

        mode="''${1:-}"
        if [ -z "$mode" ] && [ -f "$state/mode" ]; then
          mode="$(cat "$state/mode")"
        fi
        [ "$mode" = light ] || mode=dark

        if [ "$mode" = light ]; then
          install -m 644 ${files.light.sway} "$state/sway-colors"
          install -m 644 ${files.light.waybar} "$state/waybar-colors.css"
          install -m 644 ${files.light.fuzzel} "$state/fuzzel-colors.ini"
          scheme=prefer-light
          gtk_theme=Adwaita
        else
          install -m 644 ${files.dark.sway} "$state/sway-colors"
          install -m 644 ${files.dark.waybar} "$state/waybar-colors.css"
          install -m 644 ${files.dark.fuzzel} "$state/fuzzel-colors.ini"
          scheme=prefer-dark
          gtk_theme=Adwaita-dark
        fi
        printf '%s\n' "$mode" > "$state/mode"

        ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'$scheme'"
        ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'$gtk_theme'"

        if [ -n "''${SWAYSOCK:-}" ]; then
          swaymsg reload >/dev/null 2>&1 || true
        fi

        # waybar's process name is .waybar-wrapped, so no -x here
        ${pkgs.procps}/bin/pkill -USR2 waybar 2>/dev/null || true

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
