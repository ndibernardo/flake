{ lib, config, inputs, ... }:
let
  colorLib = {
    hex  = c: "0x" + lib.removePrefix "#" c;
    rgba = c: lib.removePrefix "#" c + "ff";
  };
in
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
          font = lib.mkOption {
            type = lib.types.submodule {
              options = {
                family = lib.mkOption { type = lib.types.str; };
                style = lib.mkOption { type = lib.types.str; };
                size = lib.mkOption { type = lib.types.int; };
              };
            };
          };
          colors = lib.mkOption {
            type = lib.types.submodule {
              options = {
                black         = lib.mkOption { type = lib.types.str; };
                red           = lib.mkOption { type = lib.types.str; };
                green         = lib.mkOption { type = lib.types.str; };
                yellow        = lib.mkOption { type = lib.types.str; };
                blue          = lib.mkOption { type = lib.types.str; };
                magenta       = lib.mkOption { type = lib.types.str; };
                cyan          = lib.mkOption { type = lib.types.str; };
                white         = lib.mkOption { type = lib.types.str; };
                brightBlack   = lib.mkOption { type = lib.types.str; };
                brightRed     = lib.mkOption { type = lib.types.str; };
                brightGreen   = lib.mkOption { type = lib.types.str; };
                brightYellow  = lib.mkOption { type = lib.types.str; };
                brightBlue    = lib.mkOption { type = lib.types.str; };
                brightMagenta = lib.mkOption { type = lib.types.str; };
                brightCyan    = lib.mkOption { type = lib.types.str; };
                brightWhite   = lib.mkOption { type = lib.types.str; };
                base          = lib.mkOption { type = lib.types.str; };
                surface       = lib.mkOption { type = lib.types.str; };
                muted         = lib.mkOption { type = lib.types.str; };
                accent        = lib.mkOption { type = lib.types.str; };
                accentDim     = lib.mkOption { type = lib.types.str; };
                fg            = lib.mkOption { type = lib.types.str; };
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
      specialArgs = { inherit inputs colorLib; inherit (cfg) user font colors; };
      modules = cfg.nixosModules
        ++ map (name: config.flake.nixosModules.${name}) cfg.modules;
    }
  ) config.machines;
}
