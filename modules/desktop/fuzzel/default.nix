{
  flake.nixosModules.desktop-fuzzel =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.fuzzel;
    in
    {
      options.desktop.fuzzel.enable = lib.mkEnableOption "fuzzel";

      config = lib.mkIf cfg.enable {
        core.fonts.enable = true;
        core.dotfiles.enable = true;
        applications.alacritty.enable = true;

        environment.systemPackages = [ pkgs.fuzzel ];

        core.dotfiles.links.".config/fuzzel" = lib.mkDefault "fuzzel";
      };
    };
}
