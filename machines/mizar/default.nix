{ inputs, ... }:
{
  machines.mizar = {
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
      "ghostty"
      "git"
      "desktop"
      "gnupg"
      "home-manager"
      "ld"
      "locale"
      "mtr"
      "mullvad"
      "neovim"
      "nix"
      "nvidia"
      "openrgb"
      "openssh"
      "nixpkgs"
      "steam"
      "systemd"
      "tailscale"
      "tmux"
      "users"
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
