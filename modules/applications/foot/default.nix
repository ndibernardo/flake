{
  flake.nixosModules.applications-foot =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.foot;
    in
    {
      options.applications.foot.enable = lib.mkEnableOption "foot";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;
        core.fonts.enable = true;

        environment.systemPackages = [ pkgs.foot ];

        core.dotfiles.directories = [ ".config/foot" ];
        core.dotfiles.links.".config/foot/foot.ini" = lib.mkDefault "foot/foot.ini";
      };
    };
}
