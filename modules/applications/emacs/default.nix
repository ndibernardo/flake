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
      user = config.user;
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
          elfeed
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
          visual-fill-column
          which-key
          treemacs
          treemacs-magit
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

      reloadConfiguration = pkgs.writeShellScript "emacs-reload-configuration" ''
        exec ${customEmacs}/bin/emacsclient --eval "(progn \
          (load-file user-init-file) \
          (mapc (lambda (theme) (load-theme theme t)) custom-enabled-themes) \
          (message \"Configuration reloaded\"))"
      '';
    in
    {
      options.applications.emacs.enable = lib.mkEnableOption "Emacs";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;

        home-manager.users.${user.name} = {
          home.file = {
            ".config/emacs/early-init.el".source = ./configurations/early-init.el;
            ".config/emacs/init.el".source = ./configurations/init.el;
            ".config/emacs/themes" = {
              source = ./configurations/themes;
              recursive = true;
            };
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

          systemd.user.services.emacs = {
            Unit = {
              X-Reload-Triggers = [
                "${./configurations/init.el}"
                "${./configurations/themes}"
              ];
              X-Restart-Triggers = [ "${./configurations/early-init.el}" ];
            };
            Service.ExecReload = "${reloadConfiguration}";
          };
        };
      };
    };
}
