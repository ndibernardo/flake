{
  flake.nixosModules.core-locale =
    { config, lib, ... }:
    let
      cfg = config.core.locale;
    in
    {
      options.core.locale.enable = lib.mkEnableOption "locale, keyboard and time zone";

      config = lib.mkIf cfg.enable {
        console.useXkbConfig = true;

        i18n = {
          defaultLocale = "en_US.UTF-8";
          extraLocaleSettings = {
            LC_ADDRESS = "it_IT.UTF-8";
            LC_IDENTIFICATION = "it_IT.UTF-8";
            LC_MEASUREMENT = "it_IT.UTF-8";
            LC_MONETARY = "it_IT.UTF-8";
            LC_NAME = "it_IT.UTF-8";
            LC_NUMERIC = "it_IT.UTF-8";
            LC_PAPER = "it_IT.UTF-8";
            LC_TELEPHONE = "it_IT.UTF-8";
            LC_TIME = "it_IT.UTF-8";
          };
        };

        services.xserver.xkb = {
          layout = "us";
          variant = "intl";
          options = "ctrl:nocaps";
        };

        time.timeZone = "Europe/Rome";
      };
    };
}
