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
          babashka
          clj-kondo
          cljfmt
          clojure
          clojure-lsp
          beamPackages.elixir
          elixir-ls
          fsautocomplete
          gopls
          jdk21
          leiningen
          lua-language-server
          nixd
          pyright
          rustup
          zls
        ];
      };
    };
}
