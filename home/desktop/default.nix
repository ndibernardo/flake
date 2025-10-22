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
      jetbrains.idea-ultimate
      mullvad-vpn
      nicotine-plus
      puddletag
      spotify
      thunderbird
    ];
  };
}
