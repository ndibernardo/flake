{
  username,
  homeDirectory,
  isDesktop,
  isDarwin ? false,
  inputs,
  ...
}:
{ pkgs, lib, ... }:

{
  imports =
    [
      ./development
    ]
    ++ (lib.optionals isDesktop [
      (import ./desktop { inherit isDarwin; })
    ]);

  home = {
    inherit username homeDirectory;

    packages = with pkgs; [
      curl
      claude-code
      docker-compose
      fastfetch
      rustup
      fzf
      gnumake
      htop
      ripgrep
      pkg-config
      openssl
      zip
      unzip
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
