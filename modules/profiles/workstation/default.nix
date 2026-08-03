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
          mullvad.enable = lib.mkDefault true;
          nix.enable = lib.mkDefault true;
          nixpkgs = {
            enable = lib.mkDefault true;
            unfreePackages = [
              "obsidian"
              "terraform"
            ];
          };
          openssh.enable = lib.mkDefault true;
          passwords.enable = lib.mkDefault true;
          systemd.enable = lib.mkDefault true;
          tailscale.enable = lib.mkDefault true;
          users.enable = lib.mkDefault true;
          vulnix.enable = lib.mkDefault true;
        };

        desktop = {
          fuzzel.enable = lib.mkDefault true;
          greetd.enable = lib.mkDefault true;
          gtk.enable = lib.mkDefault true;
          labwc.enable = lib.mkDefault true;
        };

        applications = {
          emacs.enable = lib.mkDefault true;
          evolution.enable = lib.mkDefault true;
          ghostty.enable = lib.mkDefault true;
          neovim.enable = lib.mkDefault true;
          steam.enable = lib.mkDefault true;
          vscode.enable = lib.mkDefault true;

          extraPackages = with pkgs; [
            helium
            obsidian
            signal-desktop
            solaar
            thunar
            ungoogled-chromium
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
            curl
            fzf
            htop
            jq
            k9s
            killall
            kind
            kubectl
            ripgrep
            terraform
            unzip
            wget
            zip
          ];
        };
      };
    };
}
