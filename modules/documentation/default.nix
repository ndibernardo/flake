{ ... }:
{
  flake.nixosModules.documentation = (
    { pkgs, ... }:
    {
      documentation.dev.enable = true;
      environment.systemPackages = with pkgs; [
        man-pages
        man-pages-posix
      ];
    }
  );
}
