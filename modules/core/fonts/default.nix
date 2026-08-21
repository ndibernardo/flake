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
            localConf = ''
              <?xml version="1.0"?>
              <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
              <fontconfig>
                <match target="scan">
                  <test name="family"><string>Berkeley Mono</string></test>
                  <test name="style"><string>Book SemiCondensed</string></test>
                  <edit name="family" mode="prepend" binding="strong">
                    <string>Berkeley Mono Book SemiCondensed</string>
                  </edit>
                </match>
              </fontconfig>
            '';
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
            fira-code
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
          ];
        };
      };
    };
}
