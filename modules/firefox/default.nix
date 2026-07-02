{ ... }:
{
  flake.nixosModules.firefox = {
    programs.firefox = {
      enable = true;
      preferences."widget.use-xdg-desktop-portal.settings" = 1;
    };
  };
}
