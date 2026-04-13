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
      "ghostty"
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
      "noctalia"
      "nvidia"
      "openrgb"
      "openssh"
      "nixpkgs"
      "qt"
      "steam"
      "systemd"
      "tailscale"
      "tmux"
      "users"
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
