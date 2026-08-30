{
  flake.nixosModules.applications-neovim =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.neovim;

      # wrapRc = false is the point of wrapping by hand: the NixOS
      # programs.neovim module wraps with a generated init file and sets
      # VIMINIT, which would shadow ~/.config/nvim/init.lua. Plugins stay
      # declarative, the configuration stays a live file.
      customNeovim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
        viAlias = true;
        vimAlias = true;
        withRuby = false;
        withPython3 = false;
        wrapRc = false;
        plugins = with pkgs.vimPlugins; [
          cmp_luasnip
          cmp-cmdline
          cmp-conjure
          cmp-nvim-lsp
          cmp-path
          comment-nvim
          conform-nvim
          conjure
          direnv-vim
          fidget-nvim
          friendly-snippets
          gitsigns-nvim
          lualine-nvim
          nfnl
          nvim-cmp
          nvim-colorizer-lua
          nvim-lspconfig
          nvim-surround
          nvim-tree-lua
          (nvim-treesitter.withPlugins (
            parsers: with parsers; [
              clojure
              commonlisp
              fennel
              lua
              markdown
              markdown_inline
              nix
              query
              vim
              vimdoc
            ]
          ))
          nvim-web-devicons
          oil-nvim
          parinfer-rust
          plenary-nvim
          render-markdown-nvim
          tairiki
          telescope-nvim
          telescope-fzf-native-nvim
          telescope-ui-select-nvim
          undotree
          vim-fugitive
          vim-rhubarb
          vim-sexp
          vim-sexp-mappings-for-regular-people
          vim-sleuth
          which-key-nvim
        ];
      };
    in
    {
      options.applications.neovim.enable = lib.mkEnableOption "Neovim";

      config = lib.mkIf cfg.enable {
        core.nixpkgs.enable = true;
        core.dotfiles.enable = true;

        environment.systemPackages = [ customNeovim ];
        environment.sessionVariables.EDITOR = lib.mkOverride 900 "nvim";

        # nfnl compiles fnl/ to lua/ on save, inside the checkout, so the whole
        # directory is linked rather than the individual files.
        core.dotfiles.links.".config/nvim" = lib.mkDefault "nvim";
      };
    };
}
