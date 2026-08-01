{
  machines.daedalus = {
    system = "x86_64-linux";
    config =
      { pkgs, ... }:
      {
        user = {
          name = "nil";
          fullName = "ndibernardo";
          email = "nicola.dibernardo@icloud.com";
          stateVersion = "25.11";
          sshKeys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHicoJtvVVNRhgCG84M4qfT7NT1vRCyKOBfQl/Imd9jY"
          ];
        };

        outputs = [
          {
            monitor = "ASUSTek COMPUTER INC XG32UCWMG T7LMQS087987";
            mode = "3840x2160@240.016Hz";
            position = "0,0";
          }
        ];

        scaleFactor = "1.1";

        core = {
          audio.enable = true;
          bluetooth.enable = true;
          dbus.enable = true;
          docker.enable = true;
          fail2ban.enable = true;
          fonts.enable = true;
          gnupg.enable = true;
          hardening.enable = true;
          home-manager.enable = true;
          journald.enable = true;
          ld.enable = true;
          locale.enable = true;
          mtr.enable = true;
          mullvad.enable = true;
          nix.enable = true;
          nixpkgs = {
            enable = true;
            unfreePackages = [
              "1password"
              "1password-cli"
              "claude-code"
              "obsidian"
              "terraform"
            ];
          };
          nvidia.enable = true;
          openrgb.enable = true;
          openssh.enable = true;
          sysstat.enable = true;
          systemd.enable = true;
          tailscale.enable = true;
          users.enable = true;
        };

        desktop = {
          fuzzel.enable = true;
          gdm.enable = true;
          gnome.enable = true;
          gtk.enable = true;
          labwc.enable = true;
          qt.enable = true;
          sway.enable = true;
        };

        applications = {
          chromium.enable = true;
          emacs.enable = true;
          firefox = {
            enable = true;
            profilePath = "58gytsnc.default";
          };
          ghostty.enable = true;
          helium.enable = true;
          neovim.enable = true;
          nyxt.enable = true;
          steam.enable = true;
          vscode.enable = true;

          extraPackages = with pkgs; [
            _1password-gui
            karere
            obsidian
            signal-desktop
            solaar
            telegram-desktop
            thunar
            thunderbird
          ];
        };

        tools = {
          atuin.enable = true;
          direnv.enable = true;
          fish.enable = true;
          git.enable = true;
          tmux.enable = true;

          extraPackages = with pkgs; [
            _1password-cli
            awscli2
            claude-code
            curl
            fzf
            htop
            jq
            k9s
            killall
            kind
            kubectl
            nodejs_24
            ripgrep
            terraform
            unzip
            uv
            wget
            zip
          ];
        };
      };
    nixosModules = [
      ./hardware.nix
      ./networking.nix
    ];
  };
}
