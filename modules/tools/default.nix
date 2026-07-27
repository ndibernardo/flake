{
  flake.nixosModules.tools =
    { config, lib, ... }:
    {
      options.tools.extraPackages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
        description = "System-wide CLI tools requiring no configuration.";
      };

      config.environment.systemPackages = config.tools.extraPackages;
    };
}
