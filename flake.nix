{
  description = "Nicola's Nix configuration flake";

  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      flake = {
        nixosConfigurations = {
          nixos = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./nixos
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.nil = ./home;
                };
              }
            ];
          };
        };
        templates = {
          clojure = {
            path = ./templates/clojure;
            description = "Clojure development environment";
          };
          elixir = {
            path = ./templates/elixir;
            description = "Elixir development environment";
          };
          java = {
            path = ./templates/java;
            description = "Java development environment";
          };
          nix = {
            path = ./templates/nix;
            description = "Nix development environment";
          };
          rust = {
            path = ./templates/rust;
            description = "Rust development environment";
          };
          zig = {
            path = ./templates/zig;
            description = "Zig development environment";
          };
          zig-master = {
            path = ./templates/zig-master;
            description = "Zig nightly development environment";
          };
        };
      };
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              gnumake
              nixd
              nixfmt
            ];
          };
        };
    };
}
