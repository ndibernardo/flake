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

      fennelConfig =
        pkgs.runCommandLocal "neovim-fennel-config"
          {
            nativeBuildInputs = [ pkgs.luaPackages.fennel ];
          }
          ''
            mkdir -p "$out/fnl" "$out/lua"
            cp --recursive ${./configurations}/fnl/. "$out/fnl/"
            cp ${./configurations}/.nfnl.fnl "$out/.nfnl.fnl"

            fennel_path='${./configurations}/fnl/?.fnl;${./configurations}/fnl/?/init.fnl'
            macro_path='${./configurations}/fnl/?.fnlm;${./configurations}/fnl/?/init.fnlm'

            while IFS= read -r source; do
              relative_path="''${source#${./configurations}/fnl/}"
              target="$out/lua/''${relative_path%.fnl}.lua"
              mkdir -p "$(dirname "$target")"
              fennel --compile --no-metadata \
                --add-fennel-path "$fennel_path" \
                --add-macro-path "$macro_path" \
                "$source" > "$target"
            done < <(find ${./configurations}/fnl -type f -name '*.fnl' | sort)
          '';
    in
    {
      options.applications.neovim.enable = lib.mkEnableOption "Neovim";

      config = lib.mkIf cfg.enable {
        core.nixpkgs.enable = true;
        core.home-manager.enable = true;

        home-manager.users.${user.name} = {
          xdg.configFile = {
            "nvim/.nfnl.fnl".source = "${fennelConfig}/.nfnl.fnl";
            "nvim/fnl".source = "${fennelConfig}/fnl";
            "nvim/lua/config".source = "${fennelConfig}/lua/config";
          };

          programs.neovim = {
            enable = true;
            defaultEditor = true;
            viAlias = true;
            vimAlias = true;
            withRuby = false;
            withPython3 = false;
            initLua = ''
              require("config")
            '';
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
        };
      };
    };
}
