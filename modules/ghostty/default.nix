{ ... }:
{
  flake.nixosModules.ghostty = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.ghostty = {
        enable = true;
        settings = {
          font-size = 12;
          window-padding-x = 10;
          window-padding-y = 10;
          scrollback-limit = 10000;

          theme = "Kanso Ink";
        };
      };
    }
  );
}
