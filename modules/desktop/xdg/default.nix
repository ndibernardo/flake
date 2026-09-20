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
      user = config.user;

      defaultApplications = {
        "text/html" = cfg.browser;
        "x-scheme-handler/http" = cfg.browser;
        "x-scheme-handler/https" = cfg.browser;
        "x-scheme-handler/about" = cfg.browser;
        "x-scheme-handler/unknown" = cfg.browser;
        "x-scheme-handler/chrome" = cfg.browser;
        "application/xhtml+xml" = cfg.browser;
        "application/x-extension-htm" = cfg.browser;
        "application/x-extension-html" = cfg.browser;
        "application/x-extension-shtml" = cfg.browser;
        "application/x-extension-xhtml" = cfg.browser;
        "application/x-extension-xht" = cfg.browser;
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
        "application/pdf" = cfg.documentViewer;
        "application/x-bzpdf" = cfg.documentViewer;
        "application/x-gzpdf" = cfg.documentViewer;
        "application/x-xzpdf" = cfg.documentViewer;
        "image/vnd.djvu" = cfg.documentViewer;
        "application/epub+zip" = cfg.ebookViewer;
        "application/x-mobipocket-ebook" = cfg.ebookViewer;
        "application/vnd.amazon.mobi8-ebook" = cfg.ebookViewer;
        "application/x-fictionbook+xml" = cfg.ebookViewer;
        "application/x-zip-compressed-fb2" = cfg.ebookViewer;
      };

      userMimeapps = pkgs.writeText "${lib.toLower cfg.desktopEnvironment}-mimeapps.list" ''
        [Default Applications]
        ${lib.concatStringsSep "\n" (
          lib.mapAttrsToList (mime: application: "${mime}=${application}") defaultApplications
        )}
      '';
    in
    {
      options.desktop.xdg = {
        enable = lib.mkEnableOption "xdg defaults";

        browser = lib.mkOption {
          type = lib.types.str;
          default = "firefox.desktop";
          description = "Desktop entry handling web links and HTML files.";
        };

        desktopEnvironment = lib.mkOption {
          type = lib.types.str;
          default = "niri";
          description = ''
            Value of `$XDG_CURRENT_DESKTOP`. Names the user-level
            `mimeapps.list` these defaults are written to, which the lookup
            order places above the file applications write themselves.
          '';
        };

        documentViewer = lib.mkOption {
          type = lib.types.str;
          default = "org.gnome.Papers.desktop";
          description = "Desktop entry used to open PDFs and other documents.";
        };

        ebookViewer = lib.mkOption {
          type = lib.types.str;
          default = "com.github.johnfactotum.Foliate.desktop";
          description = "Desktop entry used to open EPUB and other ebook formats.";
        };

        imageViewer = lib.mkOption {
          type = lib.types.str;
          default = "org.gnome.Loupe.desktop";
          description = "Desktop entry used to open images.";
        };

        terminal = lib.mkOption {
          type = lib.types.str;
          default = "com.mitchellh.ghostty.desktop";
          description = "Desktop entry launched when an app asks for a terminal.";
        };
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [ pkgs.xdg-utils ];

        systemd.tmpfiles.rules = [
          "L+ ${user.homeDirectory}/.config/${lib.toLower cfg.desktopEnvironment}-mimeapps.list - ${user.name} users - ${userMimeapps}"
        ];

        xdg.mime = {
          enable = true;
          inherit defaultApplications;
        };
      };
    };
}
