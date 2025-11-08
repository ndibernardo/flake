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
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
  };

  outputs =
    inputs@{
      flake-parts,
      nix-darwin,
      nixos-wsl,
      ...
    }:
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
              ./machines/desktop
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  backupFileExtension = "backup";
                  users.nil = ./machines/desktop/home;
                };
              }
            ];
          };
        };
        nixosConfigurations = {
          wsl = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./machines/wsl
              nixos-wsl.nixosModules.default
              {
                wsl.enable = true;
                wsl.defaultUser = "nil";
                wsl.wslConf.network.hostname = "wsl";
              }
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.nil = ./machines/wsl/home;
                };
              }
            ];
          };
        };
        darwinConfigurations = {
          macbook = nix-darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            modules = [
              ./machines/macbook
              inputs.home-manager.darwinModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.nicola = ./machines/macbook/home;
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
          scala = {
            path = ./templates/scala;
            description = "Scala development environment";
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
              lua-language-server
              nixd
              nixfmt-rfc-style
            ];
          };
        };
    };
}
