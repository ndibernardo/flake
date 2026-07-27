{
  flake.nixosModules.core-home-manager =
    { config, lib, ... }:
    let
      cfg = config.core.home-manager;
      user = config.user;
    in
    {
      options.core.home-manager.enable = lib.mkEnableOption "home-manager integration";

      config = lib.mkIf cfg.enable {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          users.${user.name} = {
            home = {
              inherit (user) homeDirectory stateVersion;
              username = user.name;
            };

            programs.home-manager.enable = true;
          };
        };
      };
    };
}
