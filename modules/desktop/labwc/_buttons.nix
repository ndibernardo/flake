# Adwaita-style titlebar buttons for labwc's server side decorations.
#
# labwc renders titlebar SVGs as-is, without recolouring them, so every
# combination of mode, focus and hover needs its own file. The names are the
# ones labwc looks for: "<button>[_hover]-<active|inactive>.svg".
{ pkgs, lib }:
let
  palette = {
    light = {
      active = {
        bg = "#cbcac7";
        hoverBg = "#bebdba";
        fg = "#1d1d1d";
      };
      inactive = {
        bg = "#e2e1df";
        hoverBg = "#d6d5d3";
        fg = "#7a7a7a";
      };
    };
    dark = {
      active = {
        bg = "#454545";
        hoverBg = "#525252";
        fg = "#ffffff";
      };
      inactive = {
        bg = "#333333";
        hoverBg = "#3d3d3d";
        fg = "#6c6c6c";
      };
    };
  };

  # Drawn on a 24x24 canvas, which is the size window.button.{width,height}
  # in the themerc files ask labwc to render the buttons at.
  glyphs = {
    close = ''<path d="M8.5 8.5 15.5 15.5M15.5 8.5 8.5 15.5"/>'';
    iconify = ''<path d="M8 14.5h8"/>'';
    max = ''<rect x="8" y="8" width="8" height="8" rx="1.7"/>'';
    max_toggled = ''
      <rect x="7.5" y="9.5" width="7" height="7" rx="1.5"/>
          <path d="M10.5 7.5h4A1.5 1.5 0 0 1 16 9v4"/>'';
  };

  svg = bg: fg: glyph: ''
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
      <circle cx="12" cy="12" r="11.5" fill="${bg}"/>
      <g fill="none" stroke="${fg}" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
        ${glyph}
      </g>
    </svg>
  '';
in
lib.mapAttrs (
  mode: modePalette:
  pkgs.linkFarm "labwc-buttons-${mode}" (
    lib.concatLists (
      lib.mapAttrsToList (
        state: colors:
        lib.concatLists (
          lib.mapAttrsToList (name: glyph: [
            {
              name = "${name}-${state}.svg";
              path = pkgs.writeText "${name}-${state}-${mode}.svg" (svg colors.bg colors.fg glyph);
            }
            {
              name = "${name}_hover-${state}.svg";
              path = pkgs.writeText "${name}_hover-${state}-${mode}.svg" (svg colors.hoverBg colors.fg glyph);
            }
          ]) glyphs
        )
      ) modePalette
    )
  )
) palette
