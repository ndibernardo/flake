{ ... }:
{
  flake.nixosModules.nix = {
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
      };
    };
  };
}
