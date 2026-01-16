{ pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/run/media/nil/64603C01603BD88E/Library";
    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
    };
    extraConfig = ''
      audio_output {
        type            "pipewire"
        name            "SSL 2+ Line 1"
        target          "alsa_output.usb-Solid_State_Logic_SSL_2_-00.HiFi__Line1__sink"
      }
    '';
  };

  home.sessionVariables = {
    MPD_HOST = "127.0.0.1";
    MPD_PORT = "6600";
  };

  home.packages = with pkgs; [
    spek
    mpc
    nicotine-plus
    puddletag
    picard
    renoise
    rmpc
  ];

  xdg.configFile."rmpc/config.ron".source = ./configurations/config.ron;
}
