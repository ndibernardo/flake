{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./fonts.nix
  ];

  home = {
    packages = with pkgs; [
      firefox-devedition
      brave
      google-chrome
      mullvad-vpn
      spotify
      ungoogled-chromium
      vscode
    ];
  };
}
