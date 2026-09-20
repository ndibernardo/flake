{
  flake.nixosModules.applications-zed =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.zed;
    in
    {
      options.applications.zed.enable = lib.mkEnableOption "Zed";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;
        core.fonts.enable = true;

        environment.systemPackages = [ pkgs.zed-editor ];

        core.dotfiles.directories = [ ".config/zed" ];
        core.dotfiles.links = {
          ".config/zed/settings.json" = lib.mkDefault "zed/settings.json";
          ".config/zed/themes" = lib.mkDefault "zed/themes";
        };
      };
    };
}
