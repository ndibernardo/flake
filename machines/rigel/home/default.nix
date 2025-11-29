{ pkgs, ... }:

{
  imports = [
    ../../../modules/alacritty
    ../../../modules/emacs
    ../../../modules/direnv
    ../../../modules/firefox
    ../../../modules/git
    ../../../modules/gtk
    ../../../modules/nvim
    ../../../modules/tmux
    ../../../modules/zsh
    ../../../modules/fonts
    ../../../modules/sway
    ../../../modules/waybar
    ../../../modules/zed
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
      postman
      dbeaver-bin
      spotify
    ];

    stateVersion = "25.05";
  };

  programs.home-manager = {
    enable = true;
  };
}
