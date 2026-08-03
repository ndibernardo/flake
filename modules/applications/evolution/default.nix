{
  flake.nixosModules.applications-evolution =
    { config, lib, ... }:
    let
      cfg = config.applications.evolution;
    in
    {
      options.applications.evolution.enable = lib.mkEnableOption "Evolution mail client";

      config = lib.mkIf cfg.enable {
        programs.evolution.enable = true;
        services.gnome.gnome-keyring.enable = true;
      };
    };
}
