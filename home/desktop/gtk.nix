{ pkgs, ... }:
{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "";
      picture-uri-dark = "";
      primary-color = "#1d2021";
      secondary-color = "#1d2021";
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
