{
  flake.nixosModules.desktop-scaling =
    { lib, ... }:
    {
      options.scaleFactor = lib.mkOption {
        type = lib.types.str;
        default = "1.0";
        description = ''
          Device scale factor applications are started with, for hosts whose
          outputs are too dense to read at their native scale.
        '';
      };
    };
}
