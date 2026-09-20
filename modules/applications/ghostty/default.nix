{
  flake.nixosModules.applications-ghostty =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.ghostty;
    in
    {
      options.applications.ghostty.enable = lib.mkEnableOption "Ghostty";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;
        core.fonts.enable = true;

        environment.systemPackages = [ pkgs.ghostty ];
        environment.sessionVariables.TERMINAL = lib.mkDefault "ghostty";
        desktop.xdg.terminal = lib.mkDefault "com.mitchellh.ghostty.desktop";

        core.dotfiles.directories = [ ".config/ghostty" ];
        core.dotfiles.links = {
          ".config/ghostty/config" = lib.mkDefault "ghostty/config";
          ".config/ghostty/themes" = lib.mkDefault "ghostty/themes";
        };
      };
    };
}
