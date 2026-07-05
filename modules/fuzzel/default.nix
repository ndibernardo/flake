{ ... }:
{
  flake.nixosModules.fuzzel = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            terminal = "ghostty -e";
            width = 30;
            lines = 10;
            prompt = ''""'';
            include = "${user.homeDirectory}/.local/state/theme/fuzzel-colors.ini";
          };
          border = {
            width = 2;
            radius = 3;
          };
        };
      };
    }
  );
}
