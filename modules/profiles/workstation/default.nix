{
  flake.nixosModules.profiles-workstation =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.profiles.workstation;
    in
    {
      options.profiles.workstation.enable = lib.mkEnableOption "workstation role";

      config = lib.mkIf cfg.enable {
        core = {
          audio.enable = lib.mkDefault true;
          diagnostics.enable = lib.mkDefault true;
          docker.enable = lib.mkDefault true;
          fail2ban.enable = lib.mkDefault true;
          fonts.enable = lib.mkDefault true;
          gnupg.enable = lib.mkDefault true;
          hardening.enable = lib.mkDefault true;
          home-manager.enable = lib.mkDefault true;
          ld.enable = lib.mkDefault true;
          locale.enable = lib.mkDefault true;
          nix.enable = lib.mkDefault true;
          nixpkgs = {
            enable = lib.mkDefault true;
            unfreePackages = [
              "obsidian"
            ];
          };
          openssh.enable = lib.mkDefault true;
          passwords.enable = lib.mkDefault true;
          systemd.enable = lib.mkDefault true;
          users.enable = lib.mkDefault true;
          virtualisation.enable = lib.mkDefault true;
          vulnix.enable = lib.mkDefault true;
        };

        desktop = {
          gtk.enable = lib.mkDefault true;
          sway.enable = lib.mkDefault true;
          xdg.enable = lib.mkDefault true;
        };

        applications = {
          alacritty.enable = lib.mkDefault true;
          emacs.enable = lib.mkDefault true;
          evolution.enable = lib.mkDefault true;
          neovim.enable = lib.mkDefault true;
          steam.enable = lib.mkDefault true;

          extraPackages = with pkgs; [
            gimp
            helium
            krita
            lutris
            nyxt
            obsidian
            pavucontrol
            signal-desktop
            solaar
            telegram-desktop
            thunar
          ];
        };

        tools = {
          atuin.enable = lib.mkDefault true;
          direnv.enable = lib.mkDefault true;
          fish.enable = lib.mkDefault true;
          git.enable = lib.mkDefault true;
          tmux.enable = lib.mkDefault true;

          extraPackages = with pkgs; [
            awscli2
            bat
            curl
            eza
            fzf
            htop
            jq
            k9s
            killall
            kind
            kubectl
            ripgrep
            rsync
            opentofu
            unzip
            wget
            zip
          ];
        };
      };
    };
}
