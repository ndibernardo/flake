{
  flake.nixosModules.core-dotfiles =
    { config, lib, ... }:
    let
      cfg = config.core.dotfiles;
      user = config.user;
      home = user.homeDirectory;

      resolve = source: if lib.hasPrefix "/" source then source else "${cfg.root}/${source}";
    in
    {
      options.core.dotfiles = {
        enable = lib.mkEnableOption "plain-file dotfiles linked into the home directory";

        root = lib.mkOption {
          type = lib.types.str;
          default = "${home}/flake/configuration";
          defaultText = lib.literalExpression ''"''${config.user.homeDirectory}/flake/configuration"'';
          description = ''
            Absolute path to the checked-out configuration directory. Links point
            here rather than into the store, so an edit takes effect as soon as
            the program rereads its configuration. A machine without the clone
            gets dangling links.
          '';
        };

        directories = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          example = [ ".config/emacs" ];
          description = ''
            Paths relative to the home directory created as real writable
            directories. Needed wherever a program writes its own state next to
            a linked file.
          '';
        };

        links = lib.mkOption {
          type = lib.types.attrsOf lib.types.str;
          default = { };
          example = lib.literalExpression ''{ ".config/sway/config" = "sway/config"; }'';
          description = ''
            Map of a path relative to the home directory to its source. A
            relative source resolves against `root`; an absolute source, a store
            path among others, is used as it stands.
          '';
        };
      };

      config = lib.mkIf cfg.enable {
        systemd.tmpfiles.rules =
          map (directory: "d ${home}/${directory} 0755 ${user.name} users - -") cfg.directories
          ++ lib.mapAttrsToList (
            target: source: "L+ ${home}/${target} - ${user.name} users - ${resolve source}"
          ) cfg.links;
      };
    };
}
