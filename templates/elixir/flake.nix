{
  description = "Elixir development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        {
          pkgs,
          ...
        }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              elixir
              elixir-ls
              nixd
              nixfmt
            ];

            shellHook = ''
              echo "Elixir development environment"
              echo "$(elixir --version 2>&1 | head -n 3 | tail -n 1)"
            '';
          };
        };
    };
}
