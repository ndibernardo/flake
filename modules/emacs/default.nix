{ pkgs, ... }:
let
  customPackages = {
    emacs = (
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
            exec-path-from-shell
            expand-region
            flycheck
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
            glsl-mode
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
  };
in
{
  home-manager.users.nil.home.file = {
    ".config/emacs/early-init.el".source = ./configurations/early-init.el;
    ".config/emacs/init.el".source = ./configurations/init.el;
  };

  home-manager.users.nil.programs = {
    emacs = {
      enable = true;
      package = customPackages.emacs;
    };
  };

  home-manager.users.nil.services = {
    emacs = {
      enable = true;
      package = customPackages.emacs;
      startWithUserSession = true;
    };
  };

  home-manager.users.nil.home.packages = with pkgs; [
    nixd
    nixfmt
    sbcl
  ];
}
