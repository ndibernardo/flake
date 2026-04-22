{ ... }:
{
  flake.nixosModules.neovim = (
    {
      pkgs,
      lib,
      user,
      ...
    }:
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
          gruvbox-nvim
          fidget-nvim
          friendly-snippets
          gitsigns-nvim
          nvim-cmp
          nvim-colorizer-lua
          nvim-lspconfig
          nvim-surround
          nvim-tree-lua
          nvim-treesitter
          nvim-web-devicons
          oil-nvim
          plenary-nvim
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
