{
  flake.nixosModules.applications-nyxt =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.nyxt;

      # GTK 3 hands the surface to the compositor through the explicit sync
      # protocol once WebKit brings up GL, but keeps committing the plain
      # shared-memory buffers it draws the chrome with, which have no acquire
      # point attached. wlroots rejects those commits and GDK dies on the
      # protocol error, so run the whole browser on XWayland instead.
      #
      # WebKit then paints a blank page because every GBM allocation its
      # DMABUF renderer attempts fails on the NVIDIA driver, so fall back to
      # the plain renderer as well.
      nyxt-wrapped = pkgs.symlinkJoin {
        name = "nyxt-wrapped-${pkgs.nyxt.version}";
        paths = [ pkgs.nyxt ];
        nativeBuildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/nyxt \
            --set GDK_BACKEND x11 \
            --set WEBKIT_DISABLE_DMABUF_RENDERER 1
        '';
      };
    in
    {
      options.applications.nyxt.enable = lib.mkEnableOption "Nyxt";

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [ nyxt-wrapped ];
      };
    };
}
