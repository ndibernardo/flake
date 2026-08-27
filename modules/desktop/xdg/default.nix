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
          };
        };
      };
    };
}
