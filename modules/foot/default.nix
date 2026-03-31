{ ... }:
{
  flake.nixosModules.foot = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.foot = {
        enable = true;
        settings = {
          main = {
            font = "Berkeley Mono:style=Regular SemiCondensed:size=12";
            pad = "5x5";
          };
          scrollback = {
            lines = 10000;
            multiplier = 3;
          };
          colors-dark = {
            background = "040606";
            foreground = "C5C9C7";
            regular0 = "040606";
            regular1 = "C34043";
            regular2 = "98BB6C";
            regular3 = "DCA561";
            regular4 = "7FB4CA";
            regular5 = "938AA9";
            regular6 = "7AA89F";
            regular7 = "C5C9C7";
            bright0 = "717C7C";
            bright1 = "E46876";
            bright2 = "98BB6C";
            bright3 = "E6C384";
            bright4 = "658594";
            bright5 = "938AA9";
            bright6 = "7AA89F";
            bright7 = "DCD7BA";
          };
          cursor = {
            style = "block";
            unfocused-style = "hollow";
          };
        };
      };
    }
  );
}
