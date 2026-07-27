{
  flake.nixosModules.core-tailscale =
    { config, lib, ... }:
    let
      cfg = config.core.tailscale;
    in
    {
      options.core.tailscale.enable = lib.mkEnableOption "Tailscale";

      config = lib.mkIf cfg.enable {
        services.tailscale.enable = true;
        networking.firewall.trustedInterfaces = [ "tailscale0" ];
      };
    };
}
