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
          default = "firefox.desktop";
          description = "Desktop entry handling web links and HTML files.";
        };

        imageViewer = lib.mkOption {
          type = lib.types.str;
          default = "org.gnome.Loupe.desktop";
          description = "Desktop entry used to open images.";
        };

        terminal = lib.mkOption {
          type = lib.types.str;
          default = "Alacritty.desktop";
          description = "Desktop entry launched when an app asks for a terminal.";
        };
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [ pkgs.xdg-utils ];
        xdg.mime = {
          enable = true;
          defaultApplications = {
            "text/html" = cfg.browser;
            "x-scheme-handler/http" = cfg.browser;
            "x-scheme-handler/https" = cfg.browser;
            "x-scheme-handler/about" = cfg.browser;
            "x-scheme-handler/unknown" = cfg.browser;
            "x-scheme-handler/terminal" = cfg.terminal;
            "image/avif" = cfg.imageViewer;
            "image/bmp" = cfg.imageViewer;
            "image/gif" = cfg.imageViewer;
            "image/heic" = cfg.imageViewer;
            "image/heif" = cfg.imageViewer;
            "image/jpeg" = cfg.imageViewer;
            "image/jxl" = cfg.imageViewer;
            "image/png" = cfg.imageViewer;
            "image/svg+xml" = cfg.imageViewer;
            "image/tiff" = cfg.imageViewer;
            "image/webp" = cfg.imageViewer;
          };
        };
      };
    };
}
