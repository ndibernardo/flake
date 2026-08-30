{
  flake.nixosModules.tools-git =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.tools.git;
    in
    {
      options.tools.git.enable = lib.mkEnableOption "Git";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        environment.systemPackages = [ pkgs.git ];

        # Anonymous defaults. A private flake carrying the real identity points
        # these two links at its own files.
        core.dotfiles.links = {
          ".config/git/config" = lib.mkDefault "git/config";
          ".config/git/ignore" = lib.mkDefault "git/ignore";
        };
      };
    };
}
