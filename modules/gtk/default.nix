{ pkgs, ... }:
{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "";
      picture-uri-dark = "";
      primary-color = "#000000";
      secondary-color = "#000000";
      color-shading-type = "solid";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };
}
