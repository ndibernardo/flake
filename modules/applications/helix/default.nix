{
  flake.nixosModules.applications-helix =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.helix;
    in
    {
      options.applications.helix.enable = lib.mkEnableOption "Helix";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        environment.systemPackages = [ pkgs.helix ];
        environment.sessionVariables.EDITOR = lib.mkOverride 900 "hx";

        core.dotfiles.links.".config/helix" = lib.mkDefault "helix";
      };
    };
}
