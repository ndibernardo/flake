{ pkgs, ... }:
{
  imports = [
    ./emacs.nix
    ./ghostty.nix
    ./fonts.nix
    ./gtk.nix
    ./zed.nix
  ];

  home = {
    packages = with pkgs; [
      firefox-devedition
      google-chrome
      jetbrains.idea-ultimate
      jetbrains.rust-rover
      mullvad-vpn
      nicotine-plus
      puddletag
      spotify
      thunderbird
      vscode
    ];
  };
}
