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
      options.desktop.fuzzel.enable = lib.mkEnableOption "fuzzel application launcher";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;
        core.fonts.enable = true;

        environment.systemPackages = [ pkgs.fuzzel ];

        core.dotfiles.directories = [ ".config/fuzzel" ];
        core.dotfiles.links.".config/fuzzel/fuzzel.ini" = lib.mkDefault "fuzzel/fuzzel.ini";
      };
    };
}
