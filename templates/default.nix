{ lib }:
builtins.readDir ./.
|> lib.filterAttrs (_: type: type == "directory")
|> lib.mapAttrs (
  name: _: {
    path = ./${name};
    inherit (import ./${name}/flake.nix) description;
  }
)
