{ pkgs, ... }:

{
  imports = [
    ./desktop
    ./development
    ./fonts.nix
  ];

  home = {
    username = "nil";
    homeDirectory = "/home/nil";

    packages = with pkgs; [
      curl
      docker-compose
      fastfetch
      fzf
      gnumake
      htop
      ripgrep
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
