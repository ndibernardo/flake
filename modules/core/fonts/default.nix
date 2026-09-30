{
  flake.nixosModules.core-fonts =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.core.fonts;
    in
    {
      options.core.fonts.enable = lib.mkEnableOption "system fonts";

      config = lib.mkIf cfg.enable {
        fonts = {
          enableDefaultPackages = false;
          fontDir.enable = true;
          fontconfig = {
            enable = true;
            antialias = true;
            hinting = {
              enable = true;
              autohint = true;
              style = "slight";
            };
            defaultFonts = {
              monospace = [
                "JetBrains Mono"
                "DejaVu Sans Mono"
              ];
              sansSerif = [
                "Noto Sans"
              ];
              serif = [
                "Noto Serif"
              ];
              emoji = [
                "Noto Color Emoji"
              ];
            };
          };
          packages = with pkgs; [
            dejavu_fonts
            inconsolata
            jetbrains-mono
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-color-emoji
            source-code-pro
          ];
        };
      };
    };
}
