{ ... }:
{
  flake.nixosModules.fonts = (
    { pkgs, ... }:
    {
      fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
          fira-code
          jetbrains-mono
          ibm-plex
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-cjk-serif
          noto-fonts-color-emoji
        ];
      };
    }
  );
}
