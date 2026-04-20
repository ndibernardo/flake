{ inputs, ... }:
{
  machines.wintermute = {
    system = "x86_64-linux";
    modules = [
      "atuin"
      "bash"
      "bemenu"
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
      "nixpkgs"
      "steam"
      "sway"
      "systemd"
      "tailscale"
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
