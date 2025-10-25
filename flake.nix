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
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
  };

  outputs =
    inputs@{ flake-parts, nixos-wsl, ... }:
    let
      homeManagerConfiguration = ./home;
    in
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
              ./hosts/desktop
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.nil = import homeManagerConfiguration {
                    isDesktop = true;
                    inputs = inputs;
                  };
                };
              }
            ];
          };
        };
        nixosConfigurations = {
          wsl = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/wsl
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
                  users.nil = import homeManagerConfiguration {
                    isDesktop = false;
                    inputs = inputs;
                  };
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
              nixd
              nixfmt-rfc-style
            ];
          };
        };
    };
}
