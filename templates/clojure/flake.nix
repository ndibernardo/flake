{
  description = "Clojure development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
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
        let
          javaVersion = 21;
          jdk = pkgs."jdk${toString javaVersion}";

          clojure = pkgs.clojure.override { jdk = jdk; };
          clojure-lsp = pkgs.clojure-lsp.override { jdk = jdk; };
          leiningen = pkgs.leiningen.override { jdk = jdk; };
        in
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              jdk
              clojure
              clojure-lsp
              leiningen
              babashka
              clj-kondo
            ];

            shellHook = ''
              echo "Clojure development environment"
              echo "Java version: $(java -version 2>&1 | head -n 1)"
              echo "Clojure version: $(clojure --version)"
            '';
          };
        };
    };
}
