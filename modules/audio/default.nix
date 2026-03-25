{ ... }:
{
  flake.nixosModules.audio = {
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
  };
}
