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
        core.fonts.enable = true;
        tools.tmux.enable = true;

        environment.systemPackages = [ pkgs.alacritty ];

        core.dotfiles.directories = [ ".config/alacritty" ];
        core.dotfiles.links.".config/alacritty/alacritty.toml" = lib.mkDefault "alacritty/alacritty.toml";
      };
    };
}
