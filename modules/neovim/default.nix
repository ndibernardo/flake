{ ... }:
{
  flake.nixosModules.neovim = (
    {
      pkgs,
      lib,
      user,
      ...
    }:
    let
      tairiki = pkgs.vimUtils.buildVimPlugin {
        name = "tairiki";
        src = pkgs.fetchFromGitHub {
          owner = "deparr";
          repo = "tairiki.nvim";
          rev = "7dd9a81f96280cfd4789582c7165787b456f1577";
          sha256 = "FRqBpvC3XyO677rtKbBOJL2kanIM6sdv9UqjZSyxkqw=";
        };
      };
    in
    {
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
    }
  );
}
