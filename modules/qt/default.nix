{ ... }:
{
  flake.nixosModules.qt = (
    { pkgs, user, ... }:
    {
      home-manager.users.${user.name}.qt = {
        enable = true;
        platformTheme.name = "gtk3";
        style = {
          name = "adwaita";
          package = pkgs.adwaita-qt;
        };
      };
    }
  );
}
