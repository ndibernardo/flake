{ pkgs, lib, ... }:

{
  imports = [
    ../../../modules/alacritty
    ../../../modules/emacs
    ../../../modules/direnv
    ../../../modules/firefox
    ../../../modules/git
    ../../../modules/nvim
    ../../../modules/tmux
    ../../../modules/zsh
    ../../../modules/fonts
    ../../../modules/sway
    ../../../modules/waybar
  ];

  home = {                    
    username = "nil";
    homeDirectory = "/home/nil";

    packages = with pkgs; [
      curl
      claude-code
      docker-compose
      fastfetch
      fzf
      htop
      ripgrep
      zip
      unzip
      spotify
      ungoogled-chromium
      vscode
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
