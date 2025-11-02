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
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        berkeley-mono = pkgs.callPackage ../packages/berkeley-mono.nix { };
      };
    };
  };

  nixpkgs.config.

  programs.nix-ld.enable =
    true;
}
