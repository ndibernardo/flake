{
  description = "Scala development environment";

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
        let
          javaVersion = 21;
          jdk = pkgs."jdk${toString javaVersion}";

          sbt = pkgs.sbt.override { jre = jdk; };
          scala = pkgs.scala_3.override { jre = jdk; };
        in
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              jdk
              scala
              sbt
              coursier
              nixd
              nixfmt
            ];

            shellHook = ''
              echo "Scala development environment"
              echo "Java version: $(java --version 2>&1 | head -n 1)"
              echo "Scala version: $(scala --version 2>&1 | head -n 1)"
            '';
          };
        };
    };
}
