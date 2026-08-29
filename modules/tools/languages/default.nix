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
      sbclWithSwank = pkgs.sbcl.withPackages (ps: [ ps.swank ]);
      conjureSbcl = pkgs.writeShellApplication {
        name = "conjure-sbcl";
        runtimeInputs = [ sbclWithSwank ];
        text = ''
          exec sbcl --noinform --disable-debugger \
            --eval '(require :asdf)' \
            --eval '(asdf:load-system :swank)' \
            --eval '(swank:create-server :port 4005 :dont-close t)' \
            --eval '(loop (sleep 3600))'
        '';
      };
    in
    {
      options.tools.languages.enable = lib.mkEnableOption "language runtimes, formatters, and language servers";

      config = lib.mkIf cfg.enable {
        environment.systemPackages =
          (with pkgs; [
            babashka
            clj-kondo
            cljfmt
            clojure
            clojure-lsp
            elixir-ls
            fennel-ls
            fnlfmt
            fsautocomplete
            gopls
            leiningen
            lua-language-server
            luaPackages.fennel
            nixd
            ocamlPackages.ocaml-lsp
            pyright
            rust-analyzer
            zls
          ])
          ++ [
            conjureSbcl
            sbclWithSwank
          ];
      };
    };
}
