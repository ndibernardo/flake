{
  flake.nixosModules.tools-atuin =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.tools.atuin;
    in
    {
      options.tools.atuin.enable = lib.mkEnableOption "atuin shell history";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        environment.systemPackages = [ pkgs.atuin ];

        # `atuin init fish | source` lives in configuration/fish/config.fish.
        core.dotfiles.directories = [ ".config/atuin" ];
        core.dotfiles.links.".config/atuin/config.toml" = lib.mkDefault "atuin/config.toml";
      };
    };
}
