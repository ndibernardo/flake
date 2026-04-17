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
            line-height = "18px";
            box-drawings-uses-font-glyphs = "yes";
            resize-by-cells = "no";
            gamma-correct-blending = "yes";
          };

          cursor = {
            blink = "no";
            style = "block";
          };

          "colors-dark" = {
            foreground = "434343";
            background = "F7F7F7";
            cursor = "434343 F7F7F7";
            regular0 = "000000";
            regular1 = "AA3731";
            regular2 = "448C27";
            regular3 = "CB9000";
            regular4 = "325CC0";
            regular5 = "7A3E9D";
            regular6 = "0083B2";
            regular7 = "BBBBBB";
            bright0 = "777777";
            bright1 = "F05050";
            bright2 = "60CB00";
            bright3 = "FFBC5D";
            bright4 = "007ACC";
            bright5 = "E64CE6";
            bright6 = "00AACB";
            bright7 = "FFFFFF";
          };

          url = {
            osc8-underline = "always";
          };
        };
      };
    }
  );
}
