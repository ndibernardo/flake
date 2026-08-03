{
  flake.nixosModules.core-nix =
    { config, lib, ... }:
    let
      cfg = config.core.nix;
    in
    {
      options.core.nix.enable = lib.mkEnableOption "Nix daemon settings and garbage collection";

      config = lib.mkIf cfg.enable {
        nix = {
          gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 3d";
            persistent = true;
          };
          optimise.automatic = true;
          settings = {
            experimental-features = [
              "flakes"
              "nix-command"
              "pipe-operators"
            ];
            warn-dirty = false;
            allowed-users = [ "@wheel" ];
            trusted-users = lib.mkForce [ "root" ];
            accept-flake-config = false;
            sandbox = true;
          };
        };
      };
    };
}
