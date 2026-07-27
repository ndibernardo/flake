{
  flake.nixosModules.applications =
    { config, lib, ... }:
    {
      options.applications.extraPackages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
        description = "System-wide applications without a dedicated module.";
      };

      config.environment.systemPackages = config.applications.extraPackages;
    };
}
