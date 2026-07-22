{ ... }:
{
  flake.nixosModules.qt = (
    { user, ... }:
    {
      home-manager.users.${user.name}.qt = {
        enable = true;
        platformTheme.name = "gtk3";
      };
    }
  );
}
