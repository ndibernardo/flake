{ pkgs, lib, ... }:
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
  direnv-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "direnv-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "NotAShelf";
      repo = "direnv.nvim";
      rev = "4dfc8758a1deab45e37b7f3661e0fd3759d85788";
      sha256 = "KqO8uDbVy4sVVZ6mHikuO+SWCzWr97ZuFRC8npOPJIE=";
    };
  };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraLuaConfig = lib.fileContents ../configurations/nvim/init.lua;
    plugins = with pkgs.vimPlugins; [
      cmp_luasnip
      cmp-cmdline
      cmp-nvim-lsp
      cmp-path
      comment-nvim
      conform-nvim
      direnv-nvim
      fidget-nvim
      friendly-snippets
      gitsigns-nvim
      lualine-nvim
      luasnip
      nvim-cmp
      nvim-colorizer-lua
      nvim-lspconfig
      nvim-surround
      ir_black
      (nvim-treesitter.withPlugins (p: [
        p.bash
        p.c
        p.html
        p.java
        p.javascript
        p.json
        p.lua
        p.markdown
        p.nix
        p.rust
        p.scala
        p.typescript
        p.vim
        p.vimdoc
        p.zig
      ]))
      nvim-treesitter-textobjects
      nvim-tree-lua
      nvim-web-devicons
      oil-nvim
      plenary-nvim
      tairiki
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
