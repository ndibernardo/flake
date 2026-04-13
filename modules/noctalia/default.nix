{ ... }:
{
  flake.nixosModules.noctalia = (
    { user, ... }:
    {
      home-manager.users.${user.name}.home.file = {
        ".config/noctalia/colorschemes/Eigengrau/Eigengrau.json".source = ./Eigengrau.json;
      };
    }
  );
}
