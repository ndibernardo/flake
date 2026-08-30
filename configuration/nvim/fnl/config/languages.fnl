(fn inlay-hints []
  (vim.lsp.inlay_hint.enable))

(local definitions [{:filetype :clojure
                     :conjure true
                     :formatter :cljfmt
                     :lsp [:clojure_lsp {}]}
                    {:filetype :elixir :lsp [:elixirls {}]}
                    {:filetype :fennel
                     :conjure true
                     :formatter :fnlfmt
                     :lsp [:fennel_ls {}]}
                    {:filetype :fsharp :lsp [:fsautocomplete {}]}
                    {:filetype :go
                     :lsp [:gopls
                           {:on_attach inlay-hints
                            :settings {:gopls {:analyses {:unusedparams true}
                                               :staticcheck true}}}]}
                    {:filetype :lua
                     :lsp [:lua_ls
                           {:settings {:Lua {:runtime {:version :LuaJIT}
                                             :diagnostics {:globals [:vim
                                                                     :require]}
                                             :workspace {:library (vim.api.nvim_get_runtime_file ""
                                                                                                 true)
                                                         :ignoreDir [:result
                                                                     :.direnv]
                                                         :checkThirdParty false}
                                             :telemetry {:enable false}}}}]}
                    {:filetype :nix
                     :lsp [:nixd
                           {:settings {:nixd {:formatting {:command [:nixfmt]}}}}]}
                    {:filetype :ocaml :lsp [:ocamllsp {}]}
                    {:filetype :python
                     :lsp [:pyright
                           {:settings {:python {:analysis {:typeCheckingMode :basic}}}}]}
                    {:filetype :rust
                     :lsp [:rust_analyzer
                           {:on_attach inlay-hints
                            :settings {:rust-analyzer {:cargo {:features :all}}}}]}
                    {:filetype :zig
                     :lsp [:zls
                           {:root_markers [:.git [:build.zig :zls.json]]
                            :settings {:zls {:enable_inlay_hints true
                                             :enable_snippets true
                                             :warn_style true}}}]}
                    {:filetype :lisp :conjure true}])

(fn lsp-servers []
  (let [servers []]
    (each [_ language (ipairs definitions)]
      (when language.lsp
        (table.insert servers language.lsp)))
    servers))

(fn formatters-by-filetype []
  (let [formatters {}]
    (each [_ language (ipairs definitions)]
      (when language.formatter
        (tset formatters language.filetype [language.formatter])))
    formatters))

(fn conjure-filetypes []
  (let [filetypes []]
    (each [_ language (ipairs definitions)]
      (when language.conjure
        (table.insert filetypes language.filetype)))
    filetypes))

{: definitions
 :lsp-servers (lsp-servers)
 :formatters-by-filetype (formatters-by-filetype)
 :conjure-filetypes (conjure-filetypes)}
