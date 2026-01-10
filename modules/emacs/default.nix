{ pkgs, ... }:
let
  clojure-jdk21 = pkgs.clojure.override { jdk = pkgs.jdk21; };

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
      epkgs: with epkgs;
      [
        avy
        consult
        corfu
        direnv
        diminish
        doom-themes
        exec-path-from-shell
        expand-region
        flycheck
        gcmh
        git-gutter
        git-gutter-fringe
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
      ++ [
        slime
      ]
      ++ [
        dockerfile-mode
        docker-compose-mode
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
    ".config/emacs/themes/doom-dark-theme.el".source = ./configurations/themes/doom-dark-theme.el;
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

  home.packages = with pkgs; [
    jdk21
    clojure-jdk21
    clojure-lsp
    rust-analyzer
    nixd
    nixfmt-rfc-style
    sbcl
  ];
}
