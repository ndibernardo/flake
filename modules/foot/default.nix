{ ... }:
{
  flake.nixosModules.foot = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.foot = {
        enable = true;
        settings = {
          main = {
            pad = "4x4";
            font = "Iosevka SS08 Extended:size=12";
            underline-thickness = "1px";
            underline-offset = "4px";
            line-height = "20px";
            box-drawings-uses-font-glyphs = "yes";
            resize-by-cells = "no";
            gamma-correct-blending = "yes";
          };

          cursor = {
            blink = "no";
            style = "block";
          };

          "colors-dark" = {
            foreground = "000000";
            background = "F7F7F7";
            cursor = "F7F7F7 434343";
            selection-foreground = "000000";
            selection-background = "dfa0f0";
            urls = "193668";
            regular0 = "000000";
            regular1 = "a60000";
            regular2 = "006800";
            regular3 = "6f5500";
            regular4 = "0031a9";
            regular5 = "721045";
            regular6 = "005e8b";
            regular7 = "a6a6a6";
            bright0 = "595959";
            bright1 = "972500";
            bright2 = "00663f";
            bright3 = "884900";
            bright4 = "3548cf";
            bright5 = "8f0075";
            bright6 = "005f5f";
            bright7 = "ffffff";
            "16" = "884900";
            "17" = "7f0000";
          };

          url = {
            osc8-underline = "always";
          };
        };
      };
    }
  );
}
