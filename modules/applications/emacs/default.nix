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
        pkgs.emacs.overrideAttrs (_: {
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
          fennel-mode
          fsharp-mode
          glsl-mode
          go-mode
          lsp-pyright
          lua-mode
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

      # The init files are no longer store paths, so the daemon cannot be
      # restarted by a rebuild when they change. This reloads a running daemon
      # against whatever is on disk right now.
      reloadConfiguration = pkgs.writeShellApplication {
        name = "emacs-reload-configuration";
        text = ''
          exec ${customEmacs}/bin/emacsclient --eval "(progn \
            (load-file user-init-file) \
            (mapc (lambda (theme) (load-theme theme t)) custom-enabled-themes) \
            (message \"Configuration reloaded\"))"
        '';
      };
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

        environment.systemPackages = [ reloadConfiguration ];

        # Emacs writes eln-cache/, custom.el and backups/ into its own
        # directory, so the directory stays real and only what the flake owns
        # is linked in.
        core.dotfiles.directories = [ ".config/emacs" ];
        core.dotfiles.links = {
          ".config/emacs/early-init.el" = lib.mkDefault "emacs/early-init.el";
          ".config/emacs/init.el" = lib.mkDefault "emacs/init.el";
          ".config/emacs/themes" = lib.mkDefault "emacs/themes";
        };
      };
    };
}
