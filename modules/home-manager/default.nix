{ ... }:
{
  flake.nixosModules.home-manager = (
    { user, ... }:
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${user.name} = {
          home = {
            inherit (user) homeDirectory;
            stateVersion = "25.11";
            username = user.name;
          };

          programs.home-manager.enable = true;
        };
      };
    }
  );
}
