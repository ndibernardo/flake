{ isDarwin ? false }:
{ pkgs, lib, ... }:
{
  imports =
    [
      ./alacritty.nix
      ./fonts.nix
    ];

  home = {
    packages =
      with pkgs;
      lib.optionals (!isDarwin) [
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
