{
  flake.nixosModules.core-docker =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.core.docker;
    in
    {
      options.core.docker.enable = lib.mkEnableOption "Docker";

      config = lib.mkIf cfg.enable {
        virtualisation.docker = {
          enable = true;
          storageDriver = "overlay2";
          autoPrune.enable = true;
        };
        environment.systemPackages = [ pkgs.docker-compose ];
      };
    };
}
