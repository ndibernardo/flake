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
      helPackage =
        epkgs:
        {
          pname,
          rev,
          hash,
          packageRequires,
        }:
        epkgs.melpaBuild {
          inherit pname packageRequires;
          version = "0.10.0";
          src = pkgs.fetchFromGitHub {
            owner = "helheim-emacs";
            repo = pname;
            inherit rev hash;
          };
        };
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
          (helPackage epkgs {
            pname = "hel-paredit";
            rev = "0a00838256aef0b459a8f76a684b8e1dee755efc";
            hash = "sha256-CO+Yf+wT/Cym5I5WW24lIjhcva2r+6RAr2K+TeErqNk=";
            packageRequires = [
              dash
              hel
              paredit
            ];
          })
          (helPackage epkgs {
            pname = "hel-vterm";
            rev = "733a5fa38d79cdddb0e9fc45cf784e541a35f14b";
            hash = "sha256-KaJRjzQtocv7j12rlWq4fUFSO5bdvWdnnlPApe7+zv4=";
            packageRequires = [
              hel
              vterm
            ];
          })
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
