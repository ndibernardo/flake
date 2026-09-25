{
  flake.nixosModules.applications-audio =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.audio;
    in
    {
      options.applications.audio = {
        enable = lib.mkEnableOption "music production: SuperCollider, Pure Data";

        realtime = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Grant the audio group the pro-audio rtprio, memlock and nice limits.";
        };
      };

      config = lib.mkIf cfg.enable {
        core.audio.enable = true;

        boot.kernel.sysctl."vm.swappiness" = lib.mkIf cfg.realtime (lib.mkDefault 10);

        environment.systemPackages = [
          pkgs.puredata
          pkgs.supercollider-with-sc3-plugins
        ];

        # The primary user is already in the audio group.
        security.pam.loginLimits = lib.mkIf cfg.realtime [
          {
            domain = "@audio";
            type = "-";
            item = "rtprio";
            value = "95";
          }
          {
            domain = "@audio";
            type = "-";
            item = "memlock";
            value = "unlimited";
          }
          {
            domain = "@audio";
            type = "-";
            item = "nice";
            value = "-19";
          }
        ];
      };
    };
}
