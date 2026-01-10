{
  description = "Zig development environment (master version)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    zig-overlay.url = "github:mitchellh/zig-overlay";
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
          system,
          ...
        }:
        let
          zig-overlay = inputs.zig-overlay.packages.${system};
        in
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              zig-overlay.master
              zls
              nixd
              nixfmt
            ];

            shellHook = ''
              echo "Zig development environment"
              echo "Zig version: $(zig version)"
            '';
          };
        };
    };
}
