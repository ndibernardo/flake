{ pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

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

  fonts.packages = with pkgs; [
    berkeley-mono
    nerd-fonts.symbols-only
    font-awesome
  ];

  system.activationScripts.fonts.text = ''
    mkdir -p /Users/nicola/Library/Fonts
    ${pkgs.rsync}/bin/rsync -av --delete \
      ${pkgs.berkeley-mono}/share/fonts/truetype/ \
      /Users/nicola/Library/Fonts/BerkeleyMonoNerd/ 2>/dev/null || true
    echo "Fonts activated. You may need to restart applications."
  '';

  environment.systemPackages = with pkgs; [
    gcc
    man-pages
    man-pages-posix
    vim
    zsh
  ];

  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.nicola = ./home;
  };

  system = {
    stateVersion = 5;
  };
}
