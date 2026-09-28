{
  flake.nixosModules.desktop-noctalia =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.noctalia;
    in
    {
      options.desktop.noctalia.enable = lib.mkEnableOption "Noctalia 5 native Wayland shell";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        programs.noctalia = {
          enable = true;
          package = pkgs.noctalia;
          systemd = {
            enable = true;
            target = "niri.service";
          };
          recommendedServices.enable = true;
        };

        core.dotfiles.directories = [ ".config/noctalia" ];
        core.dotfiles.links.".config/noctalia/config.toml" = lib.mkDefault "noctalia/config.toml";
      };
    };
}
