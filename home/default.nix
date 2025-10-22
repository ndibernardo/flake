{ isDesktop, inputs, ... }:
{ pkgs, lib, ... }:

{
  imports = [
    ./development
  ] ++ (lib.optionals isDesktop [
    ./desktop
  ]);

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
