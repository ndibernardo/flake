{ inputs, ... }:
{
  machines.wintermute = {
    system = "x86_64-linux";
    user = {
      name = "nil";
      homeDirectory = "/home/nil";
    };
    modules = [
      "alacritty"
      "audio"
      "bluetooth"
      "containers"
      "direnv"
      "docker"
      "documentation"
      "emacs"
      "fail2ban"
      "fonts"
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
      "nvidia"
      "openrgb"
      "openssh"
      "packages"
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
      ./security.nix
    ];
  };
}
