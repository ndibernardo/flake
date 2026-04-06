{ inputs, ... }:
{
  machines.avalon = {
    system = "x86_64-linux";
    modules = [
      "direnv"
      "documentation"
      "git"
      "home-manager"
      "ld"
      "locale"
      "neovim"
      "nix"
      "packages"
      "tmux"
      "users"
      "zsh"
    ];
    nixosModules = [
      inputs.home-manager.nixosModules.home-manager
      inputs.nixos-wsl.nixosModules.wsl
      ./hardware.nix
      ./networking.nix
      ./packages.nix
    ];
    user = {
      name = "nil";
      homeDirectory = "/home/nil";
    };
  };
}
