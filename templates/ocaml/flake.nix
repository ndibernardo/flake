{
  description = "OCaml development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              ocaml
              ocamlPackages.ocaml-lsp
              ocamlPackages.ocamlformat
              nixd
              nixfmt
            ];

            shellHook = ''
              echo "OCaml development environment"
              echo "OCaml version: $(ocaml --version)"
            '';
          };
        };
    };
}
