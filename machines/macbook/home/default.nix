{ pkgs, lib, ... }:

{
  imports = [ 
    ../../../modules/alacritty
    ../../../modules/emacs
    ../../../modules/direnv
    ../../../modules/git
    ../../../modules/nvim
    ../../../modules/tmux
    ../../../modules/zsh
    ../../../modules/fonts
  ];

  home = {                    
    username = "nicola";
    homeDirectory = "/home/nicola";

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
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
