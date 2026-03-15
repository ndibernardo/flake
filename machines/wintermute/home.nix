{
  flakeModules,
  inputs,
  pkgs,
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
    "${flakeModules}/waybar"
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      nil = {
        dconf = {
          enable = true;
          settings = {
            "org/gnome/desktop/interface" = {
              color-scheme = "prefer-dark";
            };
          };
        };

        gtk = {
          cursorTheme = {
            name = "Adwaita";
            size = 16;
          };
          enable = true;
          gtk3 = {
            extraConfig = {
              gtk-application-prefer-dark-theme = 1;
            };
          };
          gtk4 = {
            extraConfig = {
              gtk-application-prefer-dark-theme = 1;
            };
          };
          theme = {
            name = "Adwaita-dark";
            package = pkgs.gnome-themes-extra;
          };
        };

        home = {
          homeDirectory = "/home/nil";
          stateVersion = "25.11";
          username = "nil";
        };

        programs = {
          home-manager = {
            enable = true;
          };
        };
      };
    };
  };

  security = {
    pam = {
      services = {
        sway = {
          enableGnomeKeyring = true;
        };
      };
    };
  };

  services = {
    displayManager = {
      ly = {
        enable = true;
      };
    };

    gnome = {
      gnome-keyring = {
        enable = true;
      };
    };
  };
}
