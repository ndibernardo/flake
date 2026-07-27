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
      user = config.user;
    in
    {
      options.applications.neovim.enable = lib.mkEnableOption "Neovim";

      config = lib.mkIf cfg.enable {
        # tairiki comes from this flake's overlay
        core.nixpkgs.enable = true;
        core.home-manager.enable = true;

        home-manager.users.${user.name}.programs.neovim = {
          enable = true;
          defaultEditor = true;
          viAlias = true;
          vimAlias = true;
          withRuby = false;
          withPython3 = false;
          initLua = lib.fileContents ./configurations/init.lua;
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
            tairiki
            lualine-nvim
            nvim-cmp
            nvim-colorizer-lua
            nvim-lspconfig
            nvim-surround
            nvim-tree-lua
            nvim-treesitter
            nvim-web-devicons
            oil-nvim
            plenary-nvim
            render-markdown-nvim
            telescope-nvim
            telescope-fzf-native-nvim
            undotree
            vim-rhubarb
            vim-fugitive
            vim-sleuth
            which-key-nvim
          ];
        };
      };
    };
}
