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

          # Eigengrau color palette
          # Derived from Jack Rusher's doom-eigengrau and Noctilux
          background = "16161d";
          foreground = "b2b2bb";
          cursor-color = "b2b2bb";
          selection-background = "22222c";
          selection-foreground = "b2b2bb";

          palette = [
            "0=#16161d"
            "1=#ff463b"
            "2=#86DA87"
            "3=#DADA86"
            "4=#aaccff"
            "5=#DB85D9"
            "6=#56d4de"
            "7=#b2b2bb"
            "8=#4a4a5c"
            "9=#ff463b"
            "10=#86DA87"
            "11=#DADA86"
            "12=#aaccff"
            "13=#DB85D9"
            "14=#56d4de"
            "15=#e8e8e8"
          ];
        };
      };
    }
  );
}
