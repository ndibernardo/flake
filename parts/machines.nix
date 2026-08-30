{
  lib,
  config,
  inputs,
  ...
}:
{
  imports =
    builtins.readDir ../machines
    |> lib.filterAttrs (_: type: type == "directory")
    |> lib.mapAttrsToList (name: _: ../machines/${name}/default.nix);

  options.machines = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        options = {
          system = lib.mkOption {
            type = lib.types.str;
            default = "x86_64-linux";
          };
          config = lib.mkOption {
            type = lib.types.deferredModule;
            default = { };
            description = "NixOS configuration specific to this host.";
          };
          nixosModules = lib.mkOption {
            type = lib.types.listOf lib.types.deferredModule;
            default = [ ];
            description = "Host-specific modules.";
          };
        };
      }
    );
    default = { };
  };

  config.flake.nixosConfigurations = lib.mapAttrs (
    name: cfg:
    inputs.nixpkgs.lib.nixosSystem {
      inherit (cfg) system;
      modules = [
        inputs.lanzaboote.nixosModules.lanzaboote
        { networking.hostName = lib.mkDefault name; }
        cfg.config
      ]
      ++ cfg.nixosModules
      ++ lib.attrValues config.flake.nixosModules;
    }
  ) config.machines;
}
