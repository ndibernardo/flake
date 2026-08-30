{
  flake.nixosModules.desktop-waybar =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.waybar;
    in
    {
      options.desktop.waybar.enable = lib.mkEnableOption "Waybar";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        environment.systemPackages = with pkgs; [
          waybar
          pavucontrol
        ];

        core.dotfiles.links.".config/waybar" = lib.mkDefault "waybar";
      };
    };
}
