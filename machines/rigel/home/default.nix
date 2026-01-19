{ pkgs, ... }:

{
  imports = [
    ../../../modules/direnv
    ../../../modules/emacs
    ../../../modules/fonts
    ../../../modules/git
    ../../../modules/nvim
    ../../../modules/tmux
    ../../../modules/zsh
  ];

  home = {
    username = "nil";
    homeDirectory = "/home/nil";

    packages = with pkgs; [
      _1password-gui
      alacritty
      calibre
      claude-code
      curl
      darktable
      dbeaver-bin
      docker-compose
      fastfetch
      firefox
      fzf
      htop
      jetbrains.idea
      lutris
      nicotine-plus
      obsidian
      picard
      pinta
      postman
      puddletag
      rawtherapee
      renoise
      ripgrep
      spek
      todoist-electron
      telegram-desktop
      unzip
      zed-editor
      zip
    ];

    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };

    stateVersion = "25.05";
  };

  programs.home-manager = {
    enable = true;
  };
}
