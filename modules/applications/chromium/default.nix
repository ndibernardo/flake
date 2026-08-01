{
  flake.nixosModules.applications-chromium =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.chromium;

      chromium = pkgs.ungoogled-chromium;

      # Wrap the binary rather than the callers, so every launcher picking
      # chromium up from PATH or from its desktop entry gets the same scaling.
      # The chromium-browser alias points straight at the unwrapped binary, so
      # repoint it at the wrapper as well.
      chromium-wrapped = pkgs.symlinkJoin {
        name = "ungoogled-chromium-wrapped-${chromium.version}";
        paths = [ chromium ];
        nativeBuildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/chromium \
            --add-flags "--force-device-scale-factor=${config.scaleFactor}"
          ln -sf $out/bin/chromium $out/bin/chromium-browser
        '';
      };
    in
    {
      options.applications.chromium.enable = lib.mkEnableOption "ungoogled-chromium";

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [ chromium-wrapped ];
      };
    };
}
