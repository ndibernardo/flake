{
  flake.nixosModules.desktop-kanshi =
    { config, lib, ... }:
    let
      cfg = config.desktop.kanshi;
      user = config.user;
    in
    {
      options = {
        desktop.kanshi.enable = lib.mkEnableOption "kanshi output management, shared across window managers";

        outputs = lib.mkOption {
          type = lib.types.listOf (
            lib.types.submodule {
              options = {
                monitor = lib.mkOption {
                  type = lib.types.str;
                  description = ''
                    Kanshi output criteria, typically "<make> <model> <serial>";
                    see kanshi(5).
                  '';
                };
                mode = lib.mkOption {
                  type = lib.types.str;
                  description = "Output mode, e.g. \"3840x2160@240.016Hz\".";
                };
                position = lib.mkOption {
                  type = lib.types.str;
                  default = "0,0";
                  description = "Output position as \"x,y\".";
                };
              };
            }
          );
          default = [ ];
          description = "Per-output configuration.";
        };
      };

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;

        home-manager.users.${user.name}.services.kanshi = {
          enable = true;
          settings = [
            {
              profile.name = "default";
              profile.outputs = map (o: {
                criteria = o.monitor;
                inherit (o) mode position;
              }) config.outputs;
            }
          ];
        };
      };
    };
}
