{
  flake.nixosModules.tools-languages =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.tools.languages;
    in
    {
      options.tools.languages.enable = lib.mkEnableOption "language runtimes, formatters, and language servers";

      config = lib.mkIf cfg.enable {
        # Go's default GOPATH is $HOME/go; expose binaries installed with `go install`.
        environment.sessionVariables.PATH = [ "$HOME/go/bin" ];

        # GOTELEMETRY is read-only; set the per-user mode via the Go command.
        systemd.user.services.go-telemetry-off = {
          description = "Disable Go telemetry for the primary user";
          wantedBy = [ "default.target" ];
          unitConfig.ConditionUser = config.user.name;
          serviceConfig = {
            Type = "oneshot";
            ExecStart = "${pkgs.go}/bin/go telemetry off";
          };
        };

        environment.systemPackages = with pkgs; [
          beamPackages.elixir
          elixir-ls
          go
          gopls
          jdk21
          metals
          nixd
          nixfmt
          nodejs
          prettier
          rustup
          sbt
          scala_3
          scalafmt
          typescript
          typescript-language-server
        ];
      };
    };
}
