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
          cmp-nvim-lsp
          cmp-path
          comment-nvim
          conform-nvim
          direnv-vim
          fidget-nvim
          friendly-snippets
          gitsigns-nvim
          nvim-cmp
          nvim-lspconfig
          nvim-surround
          nvim-tree-lua
          (nvim-treesitter.withPlugins (
            parsers: with parsers; [
              elixir
              lua
              markdown
              markdown_inline
              nix
              query
              rust
              scala
              tsx
              typescript
              vim
              vimdoc
            ]
          ))
          nvim-web-devicons
          oil-nvim
          plenary-nvim
          render-markdown-nvim
          tairiki
          telescope-nvim
          telescope-fzf-native-nvim
          telescope-ui-select-nvim
          undotree
          vim-fugitive
          vim-rhubarb
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

        core.dotfiles.links.".config/nvim" = lib.mkDefault "nvim";
      };
    };
}
