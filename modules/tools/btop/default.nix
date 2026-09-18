{
  flake.nixosModules.tools-btop =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.tools.btop;
    in
    {
      options.tools.btop.enable = lib.mkEnableOption "btop resource monitor";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        environment.systemPackages = [ pkgs.btop ];

        core.dotfiles.directories = [ ".config/btop" ];
        core.dotfiles.links.".config/btop/btop.conf" = lib.mkDefault "btop/btop.conf";
      };
    };
}
