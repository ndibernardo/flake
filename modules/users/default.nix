{ ... }:
{
  flake.nixosModules.users = (
    { pkgs, user, ... }:
    {
      users.users.${user.name} = {
        description = user.name;
        extraGroups = [
          "audio"
          "bluetooth"
          "docker"
          "networkmanager"
          "video"
          "wheel"
        ];
        isNormalUser = true;
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHicoJtvVVNRhgCG84M4qfT7NT1vRCyKOBfQl/Imd9jY"
        ];
        packages = [ ];
      };
    }
  );
}
