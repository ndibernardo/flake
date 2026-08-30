{
  flake.nixosModules.applications-mpd =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.mpd;
      user = config.user;
      dataDir = "${user.homeDirectory}/.local/share/mpd";
    in
    {
      options.applications.mpd = {
        enable = lib.mkEnableOption "MPD and the rmpc client";

        musicDirectory = lib.mkOption {
          type = lib.types.str;
          default = "${user.homeDirectory}/Music";
          defaultText = lib.literalExpression ''"''${config.user.homeDirectory}/Music"'';
          description = ''
            Directory MPD scans for music. Only the mount dependency of the user
            unit is derived from this; the daemon reads the path from
            configuration/mpd/mpd.conf, which has to agree with it.
          '';
        };
      };

      config = lib.mkIf cfg.enable {
        core.audio.enable = true;
        core.dotfiles.enable = true;

        environment.systemPackages = with pkgs; [
          mpd
          rmpc
        ];

        systemd.user.services.mpd = {
          description = "Music Player Daemon";
          after = [
            "network.target"
            "sound.target"
          ];
          wantedBy = [ "default.target" ];
          unitConfig.RequiresMountsFor = [ cfg.musicDirectory ];
          serviceConfig = {
            Type = "notify";
            ExecStartPre = "${lib.getExe' pkgs.coreutils "mkdir"} -p ${dataDir}/playlists";
            ExecStart = "${lib.getExe pkgs.mpd} --no-daemon ${user.homeDirectory}/.config/mpd/mpd.conf";
            Restart = "on-failure";
          };
        };

        core.dotfiles.directories = [ ".config/mpd" ];
        core.dotfiles.links = {
          ".config/mpd/mpd.conf" = lib.mkDefault "mpd/mpd.conf";
          ".config/rmpc" = lib.mkDefault "rmpc";
        };
      };
    };
}
