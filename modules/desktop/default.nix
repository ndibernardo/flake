{ pkgs, ... }:

{
  imports = [
    ../alacritty
    ../direnv
    ../emacs
    ../fonts
    ../git
    ../nvim
    ../tmux
    ../zsh
    ./waybar.nix
  ];

  # system-level desktop configuration
  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  services.dbus.enable = true;

  xdg.portal = with pkgs; {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ kdePackages.xdg-desktop-portal-kde ];
    configPackages = [ kdePackages.xdg-desktop-portal-kde ];
  };

  programs.niri.enable = true;
  programs.xwayland.enable = true;

  environment.systemPackages = [
    pkgs.niri
    pkgs.xwayland-satellite
  ];

  # home-manager desktop configuration
  home-manager.users.nil = {
    xdg.configFile."niri/config.kdl".source = ./configurations/niri/config.kdl;

    home.sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };

    gtk = {
      enable = true;
      theme = {
        name = "Adwaita";
        package = pkgs.gnome-themes-extra;
      };
      cursorTheme = {
        name = "Adwaita";
        size = 16;
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk3";
      style.name = "adwaita";
    };

    home.packages = with pkgs; [
      _1password-gui
      adwaita-qt
      adwaita-qt6
      claude-code
      curl
      darktable
      dbeaver-bin
      docker-compose
      eliza
      fastfetch
      firefox
      fzf
      fuzzel
      htop
      killall
      libsForQt5.qt5ct
      libsForQt5.qtstyleplugins
      lutris
      mako
      networkmanagerapplet
      nicotine-plus
      obsidian
      pavucontrol
      pinta
      pcmanfm-qt
      postman
      puddletag
      rawtherapee
      renoise
      ripgrep
      spek
      swaybg
      swaylock
      thunderbird
      todoist-electron
      telegram-desktop
      unzip
      zip
    ];
  };
}
