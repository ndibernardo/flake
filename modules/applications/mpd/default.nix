{
  flake.nixosModules.applications-mpd =
    { config, lib, ... }:
    let
      cfg = config.applications.mpd;
      user = config.user;
    in
    {
      options.applications.mpd = {
        enable = lib.mkEnableOption "MPD and the rmpc client";

        musicDirectory = lib.mkOption {
          type = lib.types.str;
          default = "${user.homeDirectory}/Music";
          defaultText = lib.literalExpression ''"''${config.user.homeDirectory}/Music"'';
          description = "Directory MPD scans for music.";
        };

        port = lib.mkOption {
          type = lib.types.port;
          default = 6600;
          description = "TCP port the daemon listens on, loopback only.";
        };
      };

      config = lib.mkIf cfg.enable {
        core.audio.enable = true;
        core.home-manager.enable = true;

        home-manager.users.${user.name} = {
          services.mpd = {
            enable = true;
            inherit (cfg) musicDirectory;
            network = {
              listenAddress = "127.0.0.1";
              inherit (cfg) port;
            };
            extraConfig = ''
              # inotify-driven rescans. Silently does nothing on filesystems
              # that do not emit the events, fuseblk among them, so a manual
              # `rmpc update` stays the fallback.
              auto_update "yes"

              # mpd builds an ALSA output when none is declared, which grabs
              # the device outright; the pipewire plugin goes through the
              # session manager instead and shares it with everything else.
              audio_output {
                type "pipewire"
                name "PipeWire"
              }
            '';
          };

          systemd.user.services.mpd.Unit.RequiresMountsFor = [ cfg.musicDirectory ];

          programs.rmpc = {
            enable = true;
            config = ''
              (
                  address: "127.0.0.1:${toString cfg.port}",
                  theme: None,
              )
            '';
          };
        };
      };
    };
}
