{ ... }:
{
  flake.nixosModules.emacs = (
    { pkgs, user, ... }:
    let
      emacsPackage = pkgs.emacsPackagesFor (
        pkgs.emacs-pgtk.overrideAttrs (_: {
          withImageMagick = true;
          withNativeCompilation = true;
          withTreeSitter = true;
          withXwidgets = true;
        })
      );
      customEmacs = emacsPackage.emacsWithPackages (
        epkgs:
        with epkgs;
        [
          avy
          auto-dark
          consult
          corfu
          direnv
          diminish
          doom-themes
          doom-modeline
          exec-path-from-shell
          expand-region
          flycheck
          gcmh
          git-gutter
          git-gutter-fringe
          ligature
          lsp-mode
          magit
          marginalia
          multiple-cursors
          orderless
          paredit
          rainbow-delimiters
          rainbow-mode
          vertico
          which-key
          treemacs
          vterm
          yasnippet
        ]
        ++ [
          cider
          cider-eval-sexp-fu
          clj-refactor
          clojure-mode
          flycheck-clj-kondo
        ]
        ++ [ slime ]
        ++ [
          dockerfile-mode
          docker-compose-mode
          elixir-mode
          fsharp-mode
          glsl-mode
          go-mode
          lsp-pyright
          tuareg
          markdown-mode
          nix-mode
          rust-mode
          scala-mode
          sbt-mode
          typescript-mode
          web-mode
          zig-mode
        ]
      );
    in
    {
      home-manager.users.${user.name} = {
        home.file = {
          ".config/emacs/early-init.el".source = ./configurations/early-init.el;
          ".config/emacs/init.el".source = ./configurations/init.el;
        };
        programs.emacs = {
          enable = true;
          package = customEmacs;
        };
        services.emacs = {
          enable = true;
          package = customEmacs;
          startWithUserSession = true;
        };
      };
    }
  );
}
