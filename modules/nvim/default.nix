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

  nostromo-theme = pkgs.vimUtils.buildVimPlugin {
    name = "nostromo-theme";
    src = ./theme;
  };

  koda-theme = pkgs.vimUtils.buildVimPlugin {
    name = "koda-theme";
    src = pkgs.fetchFromGitHub {
      owner = "oskarnurm";
      repo = "koda.nvim";
      rev = "b21e91effca3b6238a6ee970699ee93c04f5e602";
      sha256 = "sha256-sQXhxv7VND+iSWjIdSiMeaaVUtQ2iTIU58RJs3x/zvo=";
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
      nostromo-theme
      koda-theme
      fidget-nvim
      friendly-snippets
      gitsigns-nvim
      luasnip
      nvim-cmp
      nvim-colorizer-lua
      colorbuddy-nvim
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
