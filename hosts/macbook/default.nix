{ pkgs, ... }:

{
  nix = {
    enable = true;
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 3d";
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
        berkeley-mono = pkgs.callPackage ../../packages/berkeley-mono.nix { };
      };
    };
  };

  users.users.nicola = {
    name = "nicola";
    home = "/Users/nicola";
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    gcc
    man-pages
    man-pages-posix
    vim
    zsh
  ];

  programs.zsh.enable = true;

  system = {
    stateVersion = 5;
  };
}
