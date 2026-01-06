{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "adwaita-dark";
  };

  home.packages = with pkgs; [
    # Required for Qt theme integration
    adwaita-qt
    adwaita-qt6
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugins
  ];
}
