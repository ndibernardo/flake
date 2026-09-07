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
      options.desktop.noctalia.enable = lib.mkEnableOption "Noctalia shell";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;
        core.fonts.enable = true;

        environment.systemPackages = [ pkgs.noctalia-shell ];

        core.dotfiles.directories = [
          ".config/noctalia"
          ".config/noctalia/colorschemes"
          ".config/noctalia/colorschemes/Eigengrau"
          ".config/noctalia/colorschemes/Pragmata"
        ];
        core.dotfiles.links = {
          ".config/noctalia/colorschemes/Eigengrau/Eigengrau.json" =
            lib.mkDefault "noctalia/colorschemes/Eigengrau/Eigengrau.json";
          ".config/noctalia/colorschemes/Pragmata/Pragmata.json" =
            lib.mkDefault "noctalia/colorschemes/Pragmata/Pragmata.json";
        };
      };
    };
}
