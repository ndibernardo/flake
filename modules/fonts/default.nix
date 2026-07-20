{ ... }:
{
  flake.nixosModules.fonts = (
    { pkgs, ... }:
    {
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
              "JetBrains Mono"
              "Berkeley Mono"
              "PragmataPro Mono"
            ];
            sansSerif = [
              "Noto Sans"
              "IBM Plex Sans"
            ];
            serif = [
              "Noto Serif"
              "IBM Plex Serif"
            ];
            emoji = [ "Noto Color Emoji" ];
          };
        };
        packages = with pkgs; [
          berkeley-mono
          fira-code
          inconsolata
          jetbrains-mono
          nerd-fonts.symbols-only
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-cjk-serif
          noto-fonts-color-emoji
        ];
      };
    }
  );
}
