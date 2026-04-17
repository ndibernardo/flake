{ ... }:
{
  flake.nixosModules.atuin = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.atuin = {
        enable = true;
        enableBashIntegration = true;
      };
    }
  );
}
