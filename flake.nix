{
  description = "Nicola's Nix configuration flake";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    import-tree.url = "github:vic/import-tree";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, import-tree, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        (import-tree ./parts)
        (import-tree ./modules)
      ];
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
    };
}
