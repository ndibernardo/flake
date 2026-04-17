{ ... }:
{
  flake.nixosModules.fonts = (
    { pkgs, ... }:
    {
      fonts = {
        enableDefaultPackages = true;
        fontconfig = {
          antialias = true;
          hinting = {
            enable = true;
            style = "slight";
          };
          subpixel = {
            lcdfilter = "default";
            rgba = "rgb";
          };
        };
        packages = with pkgs; [
          berkeley-mono
          fira-code
          (iosevka-bin.override { variant = "Aile"; })
          (iosevka-bin.override { variant = "SS08"; })
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-cjk-serif
          noto-fonts-color-emoji
        ];
      };
    }
  );
}
