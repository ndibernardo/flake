{ ... }:
{
  flake.nixosModules.direnv = (
    { user, ... }:
    {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      home-manager.users.${user.name}.programs.direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };
    }
  );
}
