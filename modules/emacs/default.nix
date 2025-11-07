{ pkgs, ... }:
let
  emacs-package = (
    (pkgs.emacsPackagesFor (
      pkgs.emacs-pgtk.overrideAttrs (oldAttrs: {
        withImageMagick = true;
        withNativeCompilation = true;
        withTreeSitter = true;
        withXwidgets = true;
      })
    )).emacsWithPackages
      (
        epkgs:
        with epkgs;
        [
          avy
          consult
          corfu
          direnv
          diminish
          doom-modeline
          doom-themes
          exec-path-from-shell
          expand-region
          flycheck
          git-gutter
          git-gutter-fringe
          gcmh
          kaolin-themes
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
          yasnippet
        ]
        ++ [
          cider
          cider-eval-sexp-fu
          clj-refactor
          clojure-mode
          flycheck-clj-kondo
        ]
        ++ [
          dockerfile-mode
          markdown-mode
          nix-mode
          rust-mode
          scala-mode
          sbt-mode
          typescript-mode
          web-mode
          zig-mode
        ]
      )
  );
in
{
  home.file = {
    ".config/emacs/early-init.el".source = ./configurations/early-init.el;
    ".config/emacs/init.el".source = ./configurations/init.el;
  };

  programs = {
    emacs = {
      enable = true;
      package = emacs-package;
    };
  };

  services = {
    emacs = {
      enable = true;
      package = emacs-package;
      startWithUserSession = true;
    };
  };
}
