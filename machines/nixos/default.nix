{ inputs, ... }:
{
  machines.nixos = {
    system = "x86_64-linux";
    modules = [
      "atuin"
      "audio"
      "bluetooth"
      "containers"
      "direnv"
      "docker"
      "documentation"
      "emacs"
      "fail2ban"
      "firefox"
      "fish"
      "fonts"
      "fuzzel"
      "ghostty"
      "git"
      "gnupg"
      "gtk"
      "home-manager"
      "ld"
      "locale"
      "ly"
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
      "tmux"
      "users"
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
