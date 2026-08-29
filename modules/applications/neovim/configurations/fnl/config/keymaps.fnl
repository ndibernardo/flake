(import-macros {: map!} :config.nvim)

(local builtin (require :telescope.builtin))
(local themes (require :telescope.themes))
(local wk (require :which-key))

(wk.setup {})
(wk.add [[:<leader>s {:group "[S]earch"}]
         [:<leader>p {:group "[P]roject"}]
         [:<localleader>c {:group "[C]onjure"}]])

(map! :n :<leader>pv :<CMD>Oil<CR> {:desc "[P]roject [V]iew"})
(map! :n :<leader>pt :<CMD>NvimTreeToggle<CR> {:desc "[P]roject [T]ree"})
(map! :v :J ":m '>+1<CR>gv=gv" {:desc "Selection Up"})
(map! :v :K ":m '<-2<CR>gv=gv" {:desc "Selection Down"})
(map! :n :J "mzJ`z")
(map! :n :<C-d> :<C-d>zz)
(map! :n :<C-u> :<C-u>zz)
(map! :n :n :nzzzv)
(map! :n :N :Nzzzv)
(map! :x :<leader>p "\"_dP")
(map! [:n :v] :<leader>y "\"+y" {:desc "[Y]ank to clipboard"})
(map! :n :<leader>Y "\"+Y" {:desc "[Y]ank line to clipboard"})
(map! [:n :v] :<leader>d "\"_d")
(map! :i :<C-c> :<Esc>)
(map! :n :Q :<nop>)
(map! :n :<C-f> "<cmd>silent !tmux neww tmux-sessionizer<CR>")
(map! :n :<C-k> :<cmd>cnext<CR>zz)
(map! :n :<C-j> :<cmd>cprev<CR>zz)
(map! :n :<leader>k :<cmd>lnext<CR>zz {:desc "Next error"})
(map! :n :<leader>j :<cmd>lprev<CR>zz {:desc "Previous error"})
(map! :n :<C-s> ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
(map! :n :<leader>x "<cmd>!chmod +x %<CR>"
      {:desc "Make a file executable" :silent true})

(map! :n :<leader>sh builtin.help_tags {:desc "[S]earch [H]elp"})
(map! :n :<leader>sk builtin.keymaps {:desc "[S]earch [K]eymaps"})
(map! :n :<leader>sf builtin.find_files {:desc "[S]earch [F]iles"})
(map! :n :<leader>ss builtin.builtin {:desc "[S]earch [S]elect Telescope"})
(map! :n :<leader>sw builtin.grep_string {:desc "[S]earch current [W]ord"})
(map! :n :<leader>sg builtin.live_grep {:desc "[S]earch by [G]rep"})
(map! :n :<leader>sd builtin.diagnostics {:desc "[S]earch [D]iagnostics"})
(map! :n :<leader>sr builtin.resume {:desc "[S]earch [R]esume"})
(map! :n :<leader>s. builtin.oldfiles
      {:desc "[S]earch Recent Files ('.' for repeat)"})

(map! :n :<leader><leader> builtin.buffers {:desc "[ ] Find existing buffers"})

(map! :n :<leader>/
      (fn []
        (builtin.current_buffer_fuzzy_find (themes.get_dropdown {:winblend 10
                                                                 :previewer false})))
      {:desc "[/] Fuzzily search in current buffer"})

(map! :n :<leader>s/
      (fn []
        (builtin.live_grep {:grep_open_files true
                            :prompt_title "Live Grep in Open Files"}))
      {:desc "[S]earch [/] in Open Files"})

(map! :n :<leader>sn
      (fn []
        (builtin.find_files {:cwd (vim.fn.stdpath :config)}))
      {:desc "[S]earch [N]eovim files"})

(map! :n :<leader>u (fn [] (vim.cmd :UndotreeToggle)) {:desc "[U]ndo tree"})
