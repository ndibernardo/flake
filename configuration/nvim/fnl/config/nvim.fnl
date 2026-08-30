(fn options! [target specification]
  "Apply a declarative option table to a Vim option proxy or ordinary table."
  (each [name value (pairs specification)]
    (tset target name value))
  target)

(fn mappings! [specification]
  "Install [mode lhs rhs options?] keymap tuples."
  (each [_ binding (ipairs specification)]
    (let [[mode lhs rhs options] binding]
      (vim.keymap.set mode lhs rhs (or options {})))))

(fn lsp-servers! [capabilities specification]
  "Configure and enable [server options] tuples with shared capabilities."
  (let [servers []]
    (each [_ [server options] (ipairs specification)]
      (table.insert servers server)
      (tset vim.lsp.config server
            (vim.tbl_deep_extend :force {: capabilities} options)))
    (vim.lsp.enable servers)))

{: options! : mappings! : lsp-servers!}
