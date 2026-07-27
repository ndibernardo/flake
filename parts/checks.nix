{
  lib,
  config,
  inputs,
  ...
}:
let
  flakeConfig = config;
in
{
  perSystem =
    {
      config,
      pkgs,
      system,
      ...
    }:
    {
      checks =
        flakeConfig.machines
        |> lib.filterAttrs (_: machine: machine.system == system)
        |> lib.mapAttrs' (
          name: _: {
            name = "machine-${name}";
            value = flakeConfig.flake.nixosConfigurations.${name}.config.system.build.toplevel;
          }
        )
        |> lib.mergeAttrs {
          formatting =
            pkgs.runCommandLocal "check-formatting"
              {
                nativeBuildInputs = [ config.formatter ];
              }
              ''
                cp --no-preserve=mode,ownership -r ${inputs.self} tree
                treefmt --tree-root tree --ci
                touch $out
              '';
        };
    };
}
