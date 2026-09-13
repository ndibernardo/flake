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
        core.nixpkgs.unfreePackages = [ "input-fonts" ];

        nixpkgs.config.input-fonts.acceptLicense = true;

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
                "TX-02 Book SemiCondensed"
                "Input Mono"
                "Fira Code"
                "Inconsolata"
                "Source Code Pro"
                "CommitMono"
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
            commit-mono
            (fira-code.override { useVariableFont = false; })
            fragment-mono
            hack-font
            inconsolata
            input-fonts
            jetbrains-mono
            kode-mono
            liberation_ttf
            nerd-fonts.symbols-only
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
