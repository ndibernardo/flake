(import-macros {: setup!} :config.nvim)

(local cmp (require :cmp))
(local languages (require :config.languages))
(local luasnip (require :luasnip))

(luasnip.config.setup {})
((. (require :luasnip.loaders.from_vscode) :lazy_load))

(cmp.setup {:snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
            :completion {:completeopt "menu,menuone,noinsert"}
            :mapping (cmp.mapping.preset.insert {:<C-n> (cmp.mapping.select_next_item)
                                                 :<C-p> (cmp.mapping.select_prev_item)
                                                 :<C-b> (cmp.mapping.scroll_docs -4)
                                                 :<C-f> (cmp.mapping.scroll_docs 4)
                                                 :<Tab> (cmp.mapping.confirm {:select true})
                                                 :<C-Space> (cmp.mapping.complete {})
                                                 :<C-l> (cmp.mapping (fn []
                                                                       (when (luasnip.expand_or_locally_jumpable)
                                                                         (luasnip.expand_or_jump)))
                                                                     [:i :s])
                                                 :<C-h> (cmp.mapping (fn []
                                                                       (when (luasnip.locally_jumpable -1)
                                                                         (luasnip.jump -1)))
                                                                     [:i :s])})
            :sources [{:name :nvim_lsp}
                      {:name :conjure}
                      {:name :luasnip}
                      {:name :path}]})

(setup! :conform
        {:format_on_save {:timeout_ms 500 :lsp_format :fallback}
         :formatters_by_ft languages.formatters-by-filetype})
