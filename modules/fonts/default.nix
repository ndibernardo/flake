{ pkgs, ... }:
let
  customPackages = with pkgs; {
    berkeley-mono = callPackage ../../packages/berkeley-mono.nix { };
    iosevka = iosevka-bin.override { variant = "SS08"; };
    #pragmata-pro = callPackage ../../packages/pragmata-pro.nix { };
  };
in
{
  fonts = {
    fontconfig = {
      enable = true;
      antialiasing = true;
      hinting = "slight";
      subpixelRendering = "rgb";
    };
  };

  home = {
    packages =
      with pkgs;
      [
        b612
        commit-mono
        dejavu_fonts
        fira-code
        hack-font
        jetbrains-mono
        inconsolata
        liberation_ttf
      ]
      ++ [
        customPackages.berkeley-mono
        customPackages.iosevka
      ]
      ++ [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        noto-fonts-monochrome-emoji
        nerd-fonts.fira-code
        nerd-fonts.symbols-only
      ];
  };
}
