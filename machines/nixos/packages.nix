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
    jq
    k9s
    killall
    kind
    kubectl
    nodejs_24
    obsidian
    ripgrep
    signal-desktop
    solaar
    telegram-desktop
    thunar
    unzip
    wget
    zip
  ];
}
