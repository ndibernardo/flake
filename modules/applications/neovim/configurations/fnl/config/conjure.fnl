(import-macros {: command! : map!} :config.nvim)

(local languages (require :config.languages))

(let [settings {"conjure#filetypes" languages.conjure-filetypes
                "conjure#log#hud#enabled" true
                "conjure#log#hud#anchor" :SE
                "conjure#client#clojure#nrepl#connection#auto_repl#enabled" true
                "conjure#client#clojure#nrepl#connection#auto_repl#hidden" true
                "conjure#client#clojure#nrepl#connection#auto_repl#cmd" "bb nrepl-server localhost:$port"
                "conjure#client#common_lisp#swank#connection#default_host" :127.0.0.1
                "conjure#client#common_lisp#swank#connection#default_port" :4005}]
  (each [name value (pairs settings)]
    (tset vim.g name value)))

(tset vim.g :parinfer_mode :smart)
(tset vim.g :parinfer_filetypes languages.conjure-filetypes)

(var swank-job nil)

(fn start-swank []
  (if swank-job
      (vim.notify "The Conjure SBCL/Swank job is already running"
                  vim.log.levels.INFO)
      (let [job (vim.fn.jobstart [:conjure-sbcl]
                                 {:detach false
                                  :on_exit (fn [_ code]
                                             (set swank-job nil)
                                             (when (not= code 0)
                                               (vim.schedule (fn []
                                                               (vim.notify (.. "SBCL/Swank exited with code "
                                                                               code)
                                                                           vim.log.levels.ERROR)))))})]
        (if (> job 0)
            (do
              (set swank-job job)
              (vim.notify "Starting SBCL/Swank on 127.0.0.1:4005"
                          vim.log.levels.INFO)
              (vim.defer_fn (fn []
                              (pcall vim.cmd "ConjureConnect 127.0.0.1 4005"))
                750))
            (vim.notify "Unable to start conjure-sbcl" vim.log.levels.ERROR)))))

(command! :ConjureSwank start-swank
          {:desc "Start SBCL/Swank and connect Conjure"})

(map! :n :<localleader>cS start-swank {:desc "[C]onjure start [S]wank"})
