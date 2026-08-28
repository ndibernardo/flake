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
        core.nixpkgs.enable = true;
        core.nixpkgs.unfreePackages = [
          "berkeley-mono"
          "pragmata-pro"
        ];

        fonts = {
          enableDefaultPackages = true;
          fontDir.enable = true;
          fontconfig = {
            enable = true;
            antialias = true;
            hinting = {
              enable = true;
              autohint = false;
              style = "slight";
            };
            subpixel = {
              rgba = "rgb";
              lcdfilter = "default";
            };
            defaultFonts = {
              monospace = [
                "Berkeley Mono"
                "PragmataPro Mono"
                "Kode Mono"
                "JetBrains Mono"
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
            berkeley-mono
            commit-mono
            departure-mono
            (fira-code.override { useVariableFont = false; })
            hack-font
            inconsolata
            jetbrains-mono
            kode-mono
            nerd-fonts.symbols-only
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-color-emoji
            pragmata-pro
            profont
            terminus_font
            terminus_font_ttf
            ttf_bitstream_vera
          ];
        };
      };
    };
}
