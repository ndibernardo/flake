{
  flake.nixosModules.applications-steam =
    { config, lib, ... }:
    let
      cfg = config.applications.steam;
    in
    {
      options.applications.steam.enable = lib.mkEnableOption "Steam and gamescope";

      config = lib.mkIf cfg.enable {
        core.nixpkgs.enable = true;
        core.nixpkgs.unfreePackages = [
          "steam"
          "steam-unwrapped"
        ];

        programs.steam.enable = true;
        programs.gamescope.enable = true;
      };
    };
}
