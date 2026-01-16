{ pkgs, ... }:

{
  home.packages = with pkgs; [
    darktable
    pinta
    rawtherapee
  ];
}
