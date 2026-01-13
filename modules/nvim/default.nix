{ pkgs, lib, ... }:
let
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
    extraLuaConfig = lib.fileContents ./configurations/init.lua;
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
      nvim-tree-lua
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
