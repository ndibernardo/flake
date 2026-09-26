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
