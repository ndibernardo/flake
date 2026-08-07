{
  flake.nixosModules.desktop-xdg =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.xdg;
    in
    {
      options.desktop.xdg = {
        enable = lib.mkEnableOption "xdg defaults";

        browser = lib.mkOption {
          type = lib.types.str;
          default = "helium.desktop";
          description = "Desktop entry handling web links and HTML files.";
        };
      };

      config = lib.mkIf cfg.enable {
        # Without xdg-open on PATH every caller falls back to its own guess:
        # Emacs walks a hardcoded list and lands on chromium, ignoring the
        # defaults below.
        environment.systemPackages = [ pkgs.xdg-utils ];

        xdg.mime = {
          enable = true;
          defaultApplications = {
            "text/html" = cfg.browser;
            "x-scheme-handler/http" = cfg.browser;
            "x-scheme-handler/https" = cfg.browser;
            "x-scheme-handler/about" = cfg.browser;
            "x-scheme-handler/unknown" = cfg.browser;
          };
        };
      };
    };
}
