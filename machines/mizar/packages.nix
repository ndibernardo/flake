{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    _1password-cli
    _1password-gui
    curl
    docker-compose
    fzf
    git
    gimp
    htop
    jetbrains.idea
    killall
    krita
    # lutris
    lynis
    man-pages
    man-pages-posix
    nicotine-plus
    nixd
    nixfmt
    obsidian
    puddletag
    ripgrep
    spek
    solaar
    ungoogled-chromium
    unzip
    vscode
    vulnix
    wget
    wl-clipboard
    xdg-utils
    zip
  ];
}
