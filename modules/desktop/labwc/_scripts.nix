{
  pkgs,
  user,
  stateDir,
  wallpaper,
  files,
  buttons,
  sfwbarCss,
}:
let
  theme-apply = pkgs.writeShellScriptBin "theme-apply" ''
    state="${stateDir}"
    mkdir -p "$state"

    mode="''${1:-}"
    if [ -z "$mode" ] && [ -f "$state/mode" ]; then
      mode="$(cat "$state/mode")"
    fi
    [ "$mode" = light ] || mode=dark

    swaybg_color=${wallpaper}

    if [ "$mode" = light ]; then
      labwc_themerc=${files.light}
      labwc_buttons=${buttons.light}
      scheme=prefer-light
      gtk_theme=Adwaita
      sfwbar_css=${sfwbarCss.light}
    else
      labwc_themerc=${files.dark}
      labwc_buttons=${buttons.dark}
      scheme=prefer-dark
      gtk_theme=Adwaita-dark
      sfwbar_css=${sfwbarCss.dark}
    fi
    printf '%s\n' "$mode" > "$state/mode"

    sfwbar_config_dir="${user.homeDirectory}/.config/sfwbar"
    mkdir -p "$sfwbar_config_dir"
    ln -sfn "$sfwbar_css" "$sfwbar_config_dir/sfwbar.css"

    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'$scheme'"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'$gtk_theme'"

    labwc_theme="${user.homeDirectory}/.local/share/themes/adwaita-labwc/openbox-3"
    mkdir -p "$labwc_theme"
    install -m 644 "$labwc_themerc" "$labwc_theme/themerc"
    install -m 644 -t "$labwc_theme" "$labwc_buttons"/*.svg
    if ${pkgs.procps}/bin/pgrep -x labwc >/dev/null 2>&1; then
      ${pkgs.labwc}/bin/labwc --reconfigure >/dev/null 2>&1 || true
      ${pkgs.procps}/bin/pkill -f "${pkgs.swaybg}/bin/swaybg" 2>/dev/null || true
      ${pkgs.swaybg}/bin/swaybg -c "$swaybg_color" &
      ${pkgs.procps}/bin/pkill -HUP sfwbar 2>/dev/null || true
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
  inherit theme-apply theme-toggle;
}
