{
  pkgs,
  inputs,
  flakeModules,
  ...
}:

{
  imports = [
    "${flakeModules}/alacritty"
    "${flakeModules}/emacs"
    "${flakeModules}/git"
    "${flakeModules}/neovim"
    "${flakeModules}/sway"
    "${flakeModules}/tmux"
    "${flakeModules}/virtualisation"
    "${flakeModules}/waybar"
    ./hardware.nix
    ./networking.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  time.timeZone = "Europe/Rome";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "it_IT.UTF-8";
      LC_IDENTIFICATION = "it_IT.UTF-8";
      LC_MEASUREMENT = "it_IT.UTF-8";
      LC_MONETARY = "it_IT.UTF-8";
      LC_NAME = "it_IT.UTF-8";
      LC_NUMERIC = "it_IT.UTF-8";
      LC_PAPER = "it_IT.UTF-8";
      LC_TELEPHONE = "it_IT.UTF-8";
      LC_TIME = "it_IT.UTF-8";
    };
  };

  console.keyMap = "us-acentos";
  documentation.dev.enable = true;
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    xkb = {
      layout = "us";
      variant = "intl";
    };
  };

  environment.systemPackages = with pkgs; [
    _1password-gui
    adwaita-qt
    adwaita-qt6
    bemenu
    brave
    brightnessctl
    curl
    docker-compose
    eliza
    firefox
    fzf
    gcc
    git
    glib
    grim
    htop
    killall
    librewolf
    lutris
    man-pages
    man-pages-posix
    nicotine-plus
    pavucontrol
    puddletag
    rhythmbox
    ripgrep
    slurp
    spek
    spotify
    swaybg
    swayidle
    swaylock
    thunar
    vim
    wget
    wl-clipboard
    xdg-utils
    unzip
    zip
    nixd
    nixfmt
    sbcl
  ];

  programs.steam.enable = true;
  programs.nix-ld.enable = true;

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      berkeley-mono
      dejavu_fonts
      fira-code
      inconsolata
      iosevka
      liberation_ttf
      newcomputermodern
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];

    fontconfig = {
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  services.dbus.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sway.enableGnomeKeyring = true;
  services.displayManager.ly.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
      persistent = true;
    };

    optimise.automatic = true;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        berkeley-mono = pkgs.callPackage ../../packages/berkeley-mono.nix { };
      };
    };
  };

  security.sudo.extraRules = [
    {
      users = [ "nil" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.nil = {
      programs.home-manager.enable = true;
      home = {
        username = "nil";
        homeDirectory = "/home/nil";
        stateVersion = "25.11";
      };
    };
  };

  home-manager.users.nil = {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };
    };
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      cursorTheme = {
        name = "Adwaita";
        size = 16;
      };

      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk3";
      style.name = "adwaita";
    };
  };

  users.users.nil = {
    isNormalUser = true;
    description = "nil";
    extraGroups = [
      "audio"
      "bluetooth"
      "docker"
      "networkmanager"
      "wheel"
    ];
    packages = [ ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHicoJtvVVNRhgCG84M4qfT7NT1vRCyKOBfQl/Imd9jY"
    ];
  };

  system.stateVersion = "25.11";
}
