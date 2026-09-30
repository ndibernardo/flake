{
  flake.nixosModules.applications-emacs =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.emacs;
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
          consult
          corfu
          direnv
          diminish
          exec-path-from-shell
          expand-region
          flycheck
          gcmh
          git-gutter
          git-gutter-fringe
          hel
          hel-paredit
          hel-vterm
          ligature
          lsp-mode
          magit
          marginalia
          orderless
          paredit
          rainbow-mode
          vertico
          visual-fill-column
          which-key
          treemacs
          treemacs-magit
          vterm
          vundo
          yasnippet
        ]
        ++ [
          dockerfile-mode
          elixir-mode
          markdown-mode
          nix-mode
          racket-mode
          rust-mode
          scala-mode
          sbt-mode
          typescript-mode
          web-mode
          yaml-mode
        ]
      );
    in
    {
      options.applications.emacs.enable = lib.mkEnableOption "Emacs";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        services.emacs = {
          enable = true;
          package = customEmacs;
          startWithGraphical = true;
        };
        core.dotfiles.directories = [ ".config/emacs" ];
        core.dotfiles.links = {
          ".config/emacs/early-init.el" = lib.mkDefault "emacs/early-init.el";
          ".config/emacs/init.el" = lib.mkDefault "emacs/init.el";
          ".config/emacs/themes" = lib.mkDefault "emacs/themes";
        };
      };
    };
}
