{
  description = "F# development environment";

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
            DOTNET_CLI_TELEMETRY_OPTOUT = "1";

            packages = with pkgs; [
              dotnet-sdk
              fsautocomplete
              nixd
              nixfmt
            ];

            shellHook = ''
              echo "F# development environment"
              echo "dotnet version: $(dotnet --version)"
            '';
          };
        };
    };
}
