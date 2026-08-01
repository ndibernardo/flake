{ inputs, ... }:
{
  flake.nixosModules.applications-helium =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.helium;

      helium = inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default;

      # Wrap the binary rather than the callers, so every launcher picking
      # helium up from PATH or from its desktop entry gets the same scaling.
      helium-wrapped = pkgs.symlinkJoin {
        name = "helium-wrapped-${helium.version}";
        paths = [ helium ];
        nativeBuildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/helium \
            --add-flags "--force-device-scale-factor=${config.scaleFactor}"
        '';
      };
    in
    {
      options.applications.helium.enable = lib.mkEnableOption "Helium";

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [ helium-wrapped ];
      };
    };
}
