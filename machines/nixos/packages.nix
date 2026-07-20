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
    solaar
    thunar
    unzip
    wget
    zip
  ];
}
