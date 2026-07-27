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
              # still gated in Nix 2.34; this flake's own modules use |>
              "pipe-operators"
            ];
            warn-dirty = false;
          };
        };
      };
    };
}
