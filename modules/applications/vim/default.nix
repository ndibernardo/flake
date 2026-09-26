{
  flake.nixosModules.applications-vim =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.applications.vim;

      batCache =
        pkgs.runCommand "vim-classic-bat-cache"
          {
            nativeBuildInputs = [ pkgs.bat ];
          }
          ''
            mkdir -p source/themes
            cp ${./base16_default_dark_plain.tmTheme} source/themes/base16_default_dark_plain.tmTheme
            HOME=$TMPDIR bat cache --build --source source --target $out
          '';

      plugins = pkgs.vimUtils.packDir {
        vim-classic.start = with pkgs.vimPlugins; [
          asyncomplete-file-vim
          asyncomplete-lsp-vim
          asyncomplete-vim
          direnv-vim
          friendly-snippets
          fzf-vim
          neoformat
          nerdtree
          undotree
          vim-elixir
          vim-fish
          vim-fugitive
          vim-gitgutter
          vim-lsp
          vim-nix
          vim-repeat
          vim-rhubarb
          vim-sleuth
          vim-surround
          vim-toml
          vim-vinegar
          vim-vsnip
          vim-vsnip-integ
          vim-which-key
        ];
      };

      vim = pkgs.writeShellScriptBin "vim" ''
        export BAT_CACHE_PATH=${batCache} BAT_THEME=base16_default_dark_plain
        exec ${pkgs.vim-classic}/bin/vim --cmd 'set packpath^=${plugins}' "$@"
      '';
    in
    {
      options.applications.vim.enable = lib.mkEnableOption "Vim";

      config = lib.mkIf cfg.enable {
        core.dotfiles.enable = true;

        environment.systemPackages = [ vim ];

        core.dotfiles.directories = [ ".vim" ];
        core.dotfiles.links = {
          ".vim/after" = lib.mkDefault "vim/after";
          ".vim/colors" = lib.mkDefault "vim/colors";
          ".vim/ftdetect" = lib.mkDefault "vim/ftdetect";
          ".vim/vimrc" = lib.mkDefault "vim/vimrc";
        };
      };
    };
}
