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
        virtualisation.podman = {
          enable = true;
          dockerCompat = true;
          defaultNetwork.settings.dns_enabled = true;
        };
        environment.systemPackages = [ pkgs.podman-compose ];
      };
    };
}
