{ pkgs, ... }:

{
  imports = [
    ../../../modules/emacs
    ../../../modules/direnv
    ../../../modules/firefox
    ../../../modules/foot
    ../../../modules/git
    ../../../modules/gtk
    ../../../modules/music
    ../../../modules/nvim
    ../../../modules/qt
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
      evince
      fastfetch
      fzf
      htop
      ripgrep
      zip
      unzip
      postman
      dbeaver-bin
      lutris
      zathura
      mupdf
      telegram-desktop
      calibre
    ];

    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "foot";
    };

    stateVersion = "25.05";
  };

  programs.home-manager = {
    enable = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";

      "inode/directory" = "thunar.desktop";
    };
  };
}
