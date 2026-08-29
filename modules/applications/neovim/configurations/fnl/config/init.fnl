(each [_ module (ipairs [:config.core
                         :config.languages
                         :config.conjure
                         :config.keymaps
                         :config.completion
                         :config.lsp
                         :config.plugins])]
  (require module))
