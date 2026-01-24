{ pkgs, ... }:

{
  home-manager.users.nil = {
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
          (iosevka-bin.override { variant = "SS08"; })
          liberation_ttf
          victor-mono
        ]
        ++ [
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-color-emoji
        ];
    };
  };
}
