(local config (require :nfnl.config))

(config.default {:compiler-options {:compilerEnv _G}
                 :source-file-patterns [:fnl/**/*.fnl]})
