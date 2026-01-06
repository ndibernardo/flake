{ pkgs, ... }:
{
  fonts = {
    fontconfig = {
      enable = true;
      antialiasing = true;
      hinting = "slight";
      subpixelRendering = "rgb";
      defaultFonts.monospace = [ "Berkeley Mono" ];
    };
  };

  home = {
    packages = with pkgs; [
      b612
      berkeley-mono
      commit-mono
      fira-code
      hack-font
      inconsolata
      inter
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji
      nerd-fonts.symbols-only
    ];
  };
}
