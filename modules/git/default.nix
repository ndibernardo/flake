{ ... }:
{
  flake.nixosModules.git = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.git = {
        enable = true;
        settings = {
          user = {
            email = "nicola.dibernardo@icloud.com";
            name = "ndibernardo";
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
    }
  );
}
