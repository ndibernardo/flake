{ pkgs, lib, ... }:

{
  imports = [ 
    ../../../modules/direnv
    ../../../modules/git
    ../../../modules/nvim
    ../../../modules/tmux
    ../../../modules/zsh
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
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
