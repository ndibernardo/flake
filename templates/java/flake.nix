{
  description = "Java development environment";

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
          javaVersion = 21; # Change this to use a different JDK version
          jdk = pkgs."jdk${toString javaVersion}";
        in
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              jdk
              maven
              jdt-language-server
              nixd
              nixfmt
            ];

            shellHook = ''
              echo "Java development environment"
              echo "Java version: $(java -version 2>&1 | head -n 1)"
            '';
          };
        };
    };
}
