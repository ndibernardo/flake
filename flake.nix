{
  description = "Nicola's Nix configuration flake";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    import-tree.url = "github:vic/import-tree";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
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
