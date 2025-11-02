{ pkgs, ... }:

{
  imports = [
    ../../nixos/audio.nix
    ../../nixos/desktop.nix
    ../../nixos/nix.nix
    ../../nixos/ssh.nix
    ../../nixos/virtualisation.nix
    ./hardware.nix
    ./networking.nix
  ];

  time.timeZone = "Europe/Rome";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "it_IT.UTF-8";
      LC_IDENTIFICATION = "it_IT.UTF-8";
      LC_MEASUREMENT = "it_IT.UTF-8";
      LC_MONETARY = "it_IT.UTF-8";
      LC_NAME = "it_IT.UTF-8";
      LC_NUMERIC = "it_IT.UTF-8";
      LC_PAPER = "it_IT.UTF-8";
      LC_TELEPHONE = "it_IT.UTF-8";
      LC_TIME = "it_IT.UTF-8";
    };
  };

  console.keyMap = "us-acentos";
  documentation.dev.enable = true;
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    xkb = {
      layout = "us";
      variant = "intl";
    };
  };

  users.users.nil = {
    isNormalUser = true;
    description = "nil";
    extraGroups = [
      "audio"
      "bluetooth"
      "docker"
      "networkmanager"
      "wheel"
    ];
    packages = [ ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHicoJtvVVNRhgCG84M4qfT7NT1vRCyKOBfQl/Imd9jY"
    ];
  };

  security.sudo.extraRules = [
    {
      users = [ "nil" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  environment.systemPackages = with pkgs; [
    gcc
    man-pages
    man-pages-posix
    vim
    zsh
  ];

  programs.steam.enable = true;
  programs.zsh.enable = true;
  system.stateVersion = "25.05";
}
