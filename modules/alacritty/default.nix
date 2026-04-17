{ ... }:
{
  flake.nixosModules.alacritty = (
    { user, ... }:
    {
      home-manager.users.${user.name}.programs.alacritty = {
        enable = true;
        settings = {
          font = {
            normal.family = "Iosevka SS08 Extended";
            size = 12;
          };
          window = {
            dynamic_title = true;
            padding = { x = 4; y = 4; };
          };
          colors = {
            primary = {
              background = "#F7F7F7";
              foreground = "#000000";
            };
            cursor = {
              text = "#F7F7F7";
              cursor = "#434343";
            };
            normal = {
              black =   "#000000";
              red =     "#AA3731";
              green =   "#448C27";
              yellow =  "#CB9000";
              blue =    "#325CC0";
              magenta = "#7A3E9D";
              cyan =    "#0083B2";
              white =   "#BBBBBB";
            };
            bright = {
              black =   "#777777";
              red =     "#F05050";
              green =   "#60CB00";
              yellow =  "#FFBC5D";
              blue =    "#007ACC";
              magenta = "#E64CE6";
              cyan =    "#00AACB";
              white =   "#FFFFFF";
            };
          };
        };
      };
    }
  );
}
