(import-macros {: autocmd! : map! : setup!} :config.nvim)

(local languages (require :config.languages))
(local nvim (require :config.nvim))
(local telescope (require :telescope.builtin))
(local capabilities ((. (require :cmp_nvim_lsp) :default_capabilities)))
(local lsp-group (vim.api.nvim_create_augroup :lsp-attach {:clear true}))

(autocmd! :LspAttach
          {:group lsp-group
           :callback (fn [event]
                       (fn buffer-map [keys action description]
                         (map! :n keys action
                               {:buffer event.buf
                                :desc (.. "LSP: " description)}))

                       (buffer-map :gd telescope.lsp_definitions
                                   "[G]oto [D]efinition")
                       (buffer-map :gr telescope.lsp_references
                                   "[G]oto [R]eferences")
                       (buffer-map :grr telescope.lsp_references
                                   "[G]oto [R]eferences")
                       (buffer-map :gI telescope.lsp_implementations
                                   "[G]oto [I]mplementation")
                       (buffer-map :<leader>D telescope.lsp_type_definitions
                                   "Type [D]efinition")
                       (buffer-map :<leader>ds telescope.lsp_document_symbols
                                   "[D]ocument [S]ymbols")
                       (buffer-map :<leader>ws
                                   telescope.lsp_dynamic_workspace_symbols
                                   "[W]orkspace [S]ymbols")
                       (buffer-map :<leader>rr vim.lsp.buf.rename "[R]ename")
                       (buffer-map :<leader>ca vim.lsp.buf.code_action
                                   "[C]ode [A]ction")
                       (buffer-map :K vim.lsp.buf.hover "Hover Documentation")
                       (buffer-map :gD vim.lsp.buf.declaration
                                   "[G]oto [D]eclaration")
                       (buffer-map :<leader>f vim.lsp.buf.format "[F]ormat")
                       (let [client (vim.lsp.get_client_by_id event.data.client_id)]
                         (when (and client
                                    client.server_capabilities.documentHighlightProvider)
                           (autocmd! [:CursorHold :CursorHoldI]
                                     {:group lsp-group
                                      :buffer event.buf
                                      :callback vim.lsp.buf.document_highlight})
                           (autocmd! [:CursorMoved :CursorMovedI]
                                     {:group lsp-group
                                      :buffer event.buf
                                      :callback vim.lsp.buf.clear_references}))))})

(autocmd! :LspDetach
          {:group lsp-group :callback (fn [_] (vim.lsp.buf.clear_references))})

(setup! :fidget {:notification {:window {:winblend 0}}})

(nvim.lsp-servers! capabilities languages.lsp-servers)
