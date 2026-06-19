{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    _1password-cli
    _1password-gui
    claude-code
    curl
    docker-compose
    fzf
    htop
    killall
    krita
    lutris
    man-pages
    man-pages-posix
    nautilus
    nixd
    nixfmt
    obsidian
    ripgrep
    spotify
    solaar
    telegram-desktop
    unzip
    wget
    zip
  ];
}
