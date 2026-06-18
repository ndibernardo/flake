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
    nixd
    nixfmt
    obsidian
    pcmanfm
    ripgrep
    solaar
    unzip
    wget
    zip
  ];
}
