{
  flake.nixosModules.core-locale =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.core.locale;
    in
    {
      options.core.locale.enable = lib.mkEnableOption "locale, keyboard and time zone";

      config = lib.mkIf cfg.enable {
        console.keyMap = pkgs.runCommand "console-keymap" { preferLocalBuild = true; } ''
          '${pkgs.buildPackages.ckbcomp}/bin/ckbcomp' \
            -layout us -variant intl -option ctrl:nocaps > "$out"
        '';

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

        time.timeZone = "Europe/Rome";
      };
    };
}
