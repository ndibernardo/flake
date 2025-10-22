{ pkgs, ... }:
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
    packages = with pkgs; [
      b612
      commit-mono
      fira-code
      hack-font
      inter
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      noto-fonts-extra
      noto-fonts-monochrome-emoji
    ];
  };
}
