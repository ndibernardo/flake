{
  flake.nixosModules.applications-alacritty =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.alacritty;
    in
    {
      options.applications.alacritty.enable = lib.mkEnableOption "Alacritty";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        environment.systemPackages = [ pkgs.alacritty ];
        environment.sessionVariables.TERMINAL = lib.mkDefault "alacritty";

        core.dotfiles.links.".config/alacritty" = lib.mkDefault "alacritty";
      };
    };
}
