{ ... }:
{
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
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        berkeley-mono = pkgs.callPackage ../../packages/berkeley-mono.nix { };
        pragmata-pro = pkgs.callPackage ../../packages/pragmata-pro.nix { };
      };
    };
  };
}
