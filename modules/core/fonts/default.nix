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
          "26091623PWV3QQ0R.zip"
          "berkeley-mono"
        ];

        fonts = {
          enableDefaultPackages = false;
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
            inconsolata
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
