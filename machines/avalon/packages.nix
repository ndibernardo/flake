{ pkgs, ... }:
{
  machine.packages = with pkgs; [
    curl
    fzf
    gcc
    git
    htop
    nixd
    nixfmt
    ripgrep
    unzip
    wget
    zip
  ];
}
