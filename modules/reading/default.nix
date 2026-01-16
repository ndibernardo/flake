{ pkgs, ... }:

{
  home.packages = with pkgs; [
    calibre
    evince
    mupdf
    zathura
  ];
}
