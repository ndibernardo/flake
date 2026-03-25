{ lib, config, inputs, ... }:
{
  imports = builtins.readDir ../machines
    |> lib.filterAttrs (_: type: type == "directory")
    |> lib.mapAttrsToList (name: _: ../machines/${name}/default.nix);

  options.machines = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        options = {
          system = lib.mkOption { type = lib.types.str; };
          user = lib.mkOption {
            type = lib.types.submodule {
              options = {
                name = lib.mkOption { type = lib.types.str; };
                homeDirectory = lib.mkOption { type = lib.types.str; };
              };
            };
          };
          nixosModules = lib.mkOption {
            type = lib.types.listOf lib.types.deferredModule;
            default = [ ];
          };
          modules = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = lib.attrNames config.flake.nixosModules;
          };
        };
      }
    );
    default = { };
  };

  config.flake.nixosConfigurations = lib.mapAttrs (
    _: cfg:
    inputs.nixpkgs.lib.nixosSystem {
      inherit (cfg) system;
      specialArgs = { inherit inputs; inherit (cfg) user; };
      modules = cfg.nixosModules
        ++ map (name: config.flake.nixosModules.${name}) cfg.modules;
    }
  ) config.machines;
}
