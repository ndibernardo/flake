{ ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "overlay2";
      autoPrune.enable = true;
    };

    oci-containers = {
      backend = "docker";
      containers."jellyfin" = {
        autoStart = true;
        image = "jellyfin/jellyfin";
        volumes = [
          "jellyfin-config:/config"
          "jellyfin-cache:/cache"
          "/run/media/nil/64603C01603BD88E/Library:/media"
        ];
        ports = [ "8096:8096" ];
        environment = {
          JELLYFIN_LOG_DIR = "/log";
        };
      };
    };
  };
}
