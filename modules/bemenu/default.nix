{ ... }:
{
  flake.nixosModules.bemenu = (
    { pkgs, user, ... }:
    let
      bemenu-opts = [
        "--tb"
        "'#F7F7F7'"
        "--tf"
        "'#000000'"
        "--fb"
        "'#F7F7F7'"
        "--ff"
        "'#000000'"
        "--nb"
        "'#F7F7F7'"
        "--nf"
        "'#434343'"
        "--hb"
        "'#000000'"
        "--hf"
        "'#F7F7F7'"
        "--sb"
        "'#000000'"
        "--sf"
        "'#F7F7F7'"
        "--cb"
        "'#F7F7F7'"
        "--cf"
        "'#434343'"
        "--ab"
        "'#F7F7F7'"
        "--af"
        "'#434343'"
        "--scb"
        "'#F7F7F7'"
        "--scf"
        "'#434343'"
        "--bdr"
        "'#000000'"
        "--hp"
        "8"
        "-B"
        "1"
        "-W"
        "0.40"
        "-c"
        "--fn"
        "'Iosevka Aile 11'"
      ];
      opts = builtins.concatStringsSep " " bemenu-opts;
      bemenu-toggle = pkgs.writeShellScriptBin "bemenu-toggle" ''
        if pgrep -x bemenu > /dev/null; then
          pkill bemenu
        else
          bemenu-run -p EXEC ${opts}
        fi
      '';
    in
    {
      environment.systemPackages = [
        bemenu-toggle
        pkgs.bemenu
      ];
    }
  );
}
