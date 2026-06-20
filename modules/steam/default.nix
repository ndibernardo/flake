{ ... }:
{
  flake.nixosModules.steam = (
    { pkgs, ... }:
    {
      programs.steam = {
        enable = true;
        package = pkgs.steam.override {
          extraLibraries = p: [ p.libpulseaudio ];
        };
      };
      programs.gamescope = {
        enable = true;
        capSysNice = true;
      };
    }
  );
}
