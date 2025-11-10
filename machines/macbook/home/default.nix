{ pkgs, lib, ... }:

{
  imports = [ 
    ../../../modules/alacritty
    ../../../modules/emacs
    ../../../modules/direnv
    ../../../modules/fonts
    ../../../modules/git
    ../../../modules/nvim
    ../../../modules/tmux
    ../../../modules/zsh
    ../../../modules/vscode
  ];

  home = {                    
    username = "nicola";
    homeDirectory = "/Users/nicola";

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
