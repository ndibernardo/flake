{ pkgs, ... }:

{
  imports = [
    ../../../modules/alacritty
    ../../../modules/foot
    ../../../modules/direnv
    ../../../modules/emacs
    ../../../modules/firefox
    ../../../modules/fonts
    ../../../modules/git
    ../../../modules/gtk
    ../../../modules/music
    ../../../modules/nvim
    ../../../modules/photography
    ../../../modules/qt
    ../../../modules/reading
    ../../../modules/sway
    ../../../modules/tmux
    ../../../modules/waybar
    ../../../modules/zed
    ../../../modules/zsh
  ];

  home = {
    username = "nil";
    homeDirectory = "/home/nil";

    packages = with pkgs; [
      claude-code
      curl
      dbeaver-bin
      docker-compose
      fastfetch
      fzf
      htop
      lutris
      postman
      ripgrep
      telegram-desktop
      unzip
      zip
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

      "image/png" = "pinta.desktop";
      "image/jpeg" = "pinta.desktop";
      "image/gif" = "pinta.desktop";
      "image/bmp" = "pinta.desktop";
      "image/webp" = "pinta.desktop";
      "image/tiff" = "pinta.desktop";
    };
  };
}
