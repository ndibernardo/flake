{ inputs, ... }:
{
  machines.nixos = {
    system = "x86_64-linux";
    modules = [
      "atuin"
      "audio"
      "bluetooth"
      "direnv"
      "docker"
      "emacs"
      "fail2ban"
      "firefox"
      "fish"
      "fonts"
      "fuzzel"
      "gdm"
      "ghostty"
      "git"
      "gnupg"
      "gtk"
      "home-manager"
      "labwc"
      "ld"
      "locale"
      "mtr"
      "mullvad"
      "neovim"
      "nix"
      "nixpkgs"
      "nvidia"
      "openrgb"
      "openssh"
      "qt"
      "steam"
      "sway"
      "systemd"
      "tailscale"
      "theme"
      "tmux"
      "users"
      "vscode"
      "waybar"
    ];
    nixosModules = [
      inputs.home-manager.nixosModules.home-manager
      ./hardware.nix
      ./networking.nix
      ./packages.nix
      ./security.nix
    ];
    user = {
      name = "nil";
      homeDirectory = "/home/nil";
    };
  };
}
