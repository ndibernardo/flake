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
            monospace = [ "PragmataPro Mono" "Berkeley Mono" "JetBrains Mono" ];
            sansSerif = [ "IBM Plex Sans" "Noto Sans" ];
            serif     = [ "IBM Plex Serif" "Noto Serif" ];
            emoji     = [ "Noto Color Emoji" ];
          };
        };
        packages = with pkgs; [
          berkeley-mono
          pragmata-pro
          fira-code
          jetbrains-mono
          ibm-plex
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-cjk-serif
          noto-fonts-color-emoji
          nerd-fonts.symbols-only
        ];
      };
    }
  );
}
