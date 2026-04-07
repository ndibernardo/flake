{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
