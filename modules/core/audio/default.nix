{
  flake.nixosModules.core-audio =
    { config, lib, ... }:
    let
      cfg = config.core.audio;
    in
    {
      options.core.audio.enable = lib.mkEnableOption "PipeWire audio";

      config = lib.mkIf cfg.enable {
        services.pipewire = {
          alsa = {
            enable = true;
            support32Bit = true;
          };
          enable = true;
          jack.enable = true;
          pulse.enable = true;
        };
        services.pulseaudio.enable = false;

        # pipewire asks rtkit for realtime scheduling
        security.rtkit.enable = true;
      };
    };
}
