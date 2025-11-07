{ pkgs, ... }:

{
  imports = [
     ../../modules/nix
  ];

  users.users.nil = {
    isNormalUser = true;
    description = "nil";
    extraGroups = [
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

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;
  system.stateVersion = "25.05";
}
