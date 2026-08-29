(import-macros {: autocmd! : map! : setup!} :config.nvim)

(setup! :colorizer {})
(setup! :Comment {})
(setup! :gitsigns {})
(setup! :nvim-surround {})

(setup! :oil {:default_file_explorer true
              :delete_to_trash true
              :columns []
              :view_options {:show_hidden true}})

(setup! :nvim-tree
        {:sort_by :case_sensitive
         :hijack_netrw false
         :view {:width 40 :side :right}
         :renderer {:group_empty true}
         :filters {:dotfiles false}
         :update_focused_file {:enable true}
         :on_attach (fn [buffer]
                      (let [api (require :nvim-tree.api)]
                        (api.config.mappings.default_on_attach buffer)
                        (map! :n :<LeftRelease> api.node.open.edit
                              {: buffer :noremap true :silent true})))})

(autocmd! :QuitPre
          {:callback (fn []
                       (let [tree-windows []
                             floating-windows []
                             windows (vim.api.nvim_list_wins)]
                         (each [_ window (ipairs windows)]
                           (let [buffer-name (vim.api.nvim_buf_get_name (vim.api.nvim_win_get_buf window))
                                 window-config (vim.api.nvim_win_get_config window)]
                             (when (: buffer-name :match :NvimTree_)
                               (table.insert tree-windows window))
                             (when (not= "" window-config.relative)
                               (table.insert floating-windows window))))
                         (when (= 1
                                  (- (length windows) (length floating-windows)
                                     (length tree-windows)))
                           (each [_ window (ipairs tree-windows)]
                             (vim.api.nvim_win_close window true)))))})

(local telescope (require :telescope))
(local themes (require :telescope.themes))

(telescope.setup {:defaults {:file_ignore_patterns [:node_modules/.* :.git/.*]}
                  :pickers {:find_files {:find_command [:rg
                                                        :--files
                                                        :--hidden
                                                        :--glob
                                                        :!**/.git/*]}
                            :grep_string {:additional_args [:--hidden]}
                            :live_grep {:additional_args [:--hidden]}}
                  :extensions {:ui-select (themes.get_dropdown)}})

(each [_ extension (ipairs [:fzf :ui-select])]
  (pcall telescope.load_extension extension))

(setup! :nvim-treesitter {:highlight {:enable true
                                      :additional_vim_regex_highlighting true}
                          :indent {:enable true}})

(setup! :render-markdown {:win_options {:wrap {:default false :rendered true}}
                          :heading {:backgrounds []}})

(local tairiki (require :tairiki))
(tairiki.setup {:palette :dimmed
                :default_dark :tomorrow
                :transparent true
                :terminal false
                :end_of_buffer false
                :visual_bold false
                :cmp_itemkind_reverse false
                :diagnostics {:darker false :background true :undercurl false}
                :code_style {:comments {:italic false}
                             :conditionals {}
                             :keywords {}
                             :functions {}
                             :strings {}
                             :variables {}
                             :parameters {}
                             :types {}}
                :highlights (fn [_ _ _])})

(set vim.o.background :dark)
(tairiki.load)

(setup! :lualine {:options {:theme :tomorrow_night
                            :icons_enabled false
                            :component_separators {:left "|" :right "|"}
                            :section_separators {:left "" :right ""}
                            :globalstatus true}
                  :sections {:lualine_a [:mode]
                             :lualine_b [:branch :diff :diagnostics]
                             :lualine_c [:filename]
                             :lualine_x []
                             :lualine_y [:progress]
                             :lualine_z [:location]}})
