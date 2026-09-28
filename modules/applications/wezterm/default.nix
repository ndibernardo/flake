{
  flake.nixosModules.applications-wezterm =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.wezterm;
    in
    {
      options.applications.wezterm.enable = lib.mkEnableOption "WezTerm";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;
        core.fonts.enable = true;

        environment.systemPackages = [ pkgs.wezterm ];

        core.dotfiles.directories = [ ".config/wezterm" ];
        core.dotfiles.links.".config/wezterm/wezterm.lua" = lib.mkDefault "wezterm/wezterm.lua";
      };
    };
}
