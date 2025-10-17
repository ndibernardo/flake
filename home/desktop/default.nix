{ pkgs, ... }:
{
  imports = [
    ./gtk.nix
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
