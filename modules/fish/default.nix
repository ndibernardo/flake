{ ... }:
{
  flake.nixosModules.fish = (
    { pkgs, user, ... }:
    {
      programs.fish.enable = true;

      users.users.${user.name}.shell = pkgs.fish;

      home-manager.users.${user.name}.programs.fish = {
        enable = true;
        interactiveShellInit = "set -g fish_greeting";
        shellAliases = {
          ll = "ls -la";
        };
      };
    }
  );
}
