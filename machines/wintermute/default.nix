{ inputs, ... }:
{
  machines.wintermute = {
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
      "fonts"
      "foot"
      "fuzzel"
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
      "niri"
      "nix"
      "nvidia"
      "openrgb"
      "openssh"
      "packages"
      "qt"
      "steam"
      "sway"
      "systemd"
      "tailscale"
      "tmux"
      "users"
      "waybar"
      "zsh"
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
