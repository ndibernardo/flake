{ ... }:
{
  flake.nixosModules.ghostty = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.ghostty = {
        enable = true;
        settings = {
          font-family = "Berkeley Mono";
          font-style = "Regular SemiCondensed";
          font-size = 12;
          window-padding-x = 10;
          window-padding-y = 10;
          scrollback-limit = 10000;

          theme = "Gruvbox Dark Hard";
        };
      };
    }
  );
}
