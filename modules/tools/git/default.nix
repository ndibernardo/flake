{
  flake.nixosModules.tools-git =
    { config, lib, ... }:
    let
      cfg = config.tools.git;
      user = config.user;
    in
    {
      options.tools.git.enable = lib.mkEnableOption "Git";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;

        home-manager.users.${user.name}.programs.git = {
          enable = true;
          settings = {
            user = {
              inherit (user) email;
              name = user.fullName;
              signingkey = "~/.ssh/id_ed25519.pub";
            };
            commit.gpgsign = true;
            gpg.format = "ssh";
          };
          ignores = [
            "/.*/"
            "/*-out/"
            "/target/"
            ".DS_STORE"
            "TAGS"
          ];
        };
      };
    };
}
