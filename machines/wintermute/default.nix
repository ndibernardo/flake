{
  flakeModules,
  pkgs,
  ...
}:

{
  imports = [
    "${flakeModules}/virtualisation"
    ./hardware.nix
    ./home.nix
    ./locale.nix
    ./networking.nix
    ./security.nix
  ];

  documentation = {
    dev = {
      enable = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      _1password-cli
      _1password-gui
      aide
      bemenu
      brightnessctl
      clamav
      curl
      docker-compose
      doublecmd
      fzf
      gcc
      git
      glib
      grim
      htop
      killall
      librewolf
      lutris
      lynis
      man-pages
      man-pages-posix
      nicotine-plus
      nixd
      nixfmt
      pavucontrol
      puddletag
      ripgrep
      slurp
      spek
      swaybg
      swayidle
      swaylock
      ungoogled-chromium
      unzip
      vim
      wget
      wl-clipboard
      xdg-utils
      xfce.thunar
      zip
    ];
  };

  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };
    };
    packages = with pkgs; [
      berkeley-mono
      fira-code
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
      persistent = true;
    };
    optimise = {
      automatic = true;
    };
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
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

  programs = {
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };

    nix-ld = {
      enable = true;
    };

    steam = {
      enable = true;
    };

    sway = {
      enable = true;
      wrapperFeatures = {
        base = true;
        gtk = true;
      };
    };
  };

  services = {
    pipewire = {
      alsa = {
        enable = true;
        support32Bit = true;
      };
      enable = true;
      jack = {
        enable = true;
      };
      pulse = {
        enable = true;
      };
    };
    pulseaudio = {
      enable = false;
    };
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };
  };

  system = {
    stateVersion = "25.11";
  };

  systemd = {
    targets = {
      hibernate = {
        enable = false;
      };
      hybrid-sleep = {
        enable = false;
      };
      sleep = {
        enable = false;
      };
      suspend = {
        enable = false;
      };
    };
  };

  users = {
    users = {
      nil = {
        description = "nil";
        extraGroups = [
          "audio"
          "bluetooth"
          "docker"
          "networkmanager"
          "video"
          "wheel"
        ];
        isNormalUser = true;
        openssh = {
          authorizedKeys = {
            keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHicoJtvVVNRhgCG84M4qfT7NT1vRCyKOBfQl/Imd9jY"
            ];
          };
        };
        packages = [ ];
      };
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      wlr = {
        enable = true;
      };
    };
  };
}
