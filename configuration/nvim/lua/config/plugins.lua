require("colorizer").setup({})
require("Comment").setup({})
require("gitsigns").setup({})
require("nvim-surround").setup({})
require("oil").setup({default_file_explorer = true, delete_to_trash = true, columns = {}, view_options = {show_hidden = true}})
local function _1_(buffer)
  local api = require("nvim-tree.api")
  api.config.mappings.default_on_attach(buffer)
  return vim.keymap.set("n", "<LeftRelease>", api.node.open.edit, {buffer = buffer, noremap = true, silent = true})
end
require("nvim-tree").setup({sort_by = "case_sensitive", view = {width = 40, side = "right"}, renderer = {group_empty = true}, filters = {dotfiles = false}, update_focused_file = {enable = true}, on_attach = _1_, hijack_netrw = false})
local function _2_()
  local tree_windows = {}
  local floating_windows = {}
  local windows = vim.api.nvim_list_wins()
  for _, window in ipairs(windows) do
    local buffer_name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(window))
    local window_config = vim.api.nvim_win_get_config(window)
    if buffer_name:match("NvimTree_") then
      table.insert(tree_windows, window)
    else
    end
    if ("" ~= window_config.relative) then
      table.insert(floating_windows, window)
    else
    end
  end
  if (1 == (#windows - #floating_windows - #tree_windows)) then
    for _, window in ipairs(tree_windows) do
      vim.api.nvim_win_close(window, true)
    end
    return nil
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("QuitPre", {callback = _2_})
local telescope = require("telescope")
local themes = require("telescope.themes")
telescope.setup({defaults = {file_ignore_patterns = {"node_modules/.*", ".git/.*"}}, pickers = {find_files = {find_command = {"rg", "--files", "--hidden", "--glob", "!**/.git/*"}}, grep_string = {additional_args = {"--hidden"}}, live_grep = {additional_args = {"--hidden"}}}, extensions = {["ui-select"] = themes.get_dropdown()}})
for _, extension in ipairs({"fzf", "ui-select"}) do
  pcall(telescope.load_extension, extension)
end
require("nvim-treesitter").setup({highlight = {enable = true, additional_vim_regex_highlighting = true}, indent = {enable = true}})
require("render-markdown").setup({win_options = {wrap = {rendered = true, default = false}}, heading = {backgrounds = {}}})
local tairiki = require("tairiki")
local function _6_(_, _0, _1)
end
tairiki.setup({palette = "dimmed", default_dark = "tomorrow", transparent = true, diagnostics = {background = true, darker = false, undercurl = false}, code_style = {comments = {italic = false}, conditionals = {}, keywords = {}, functions = {}, strings = {}, variables = {}, parameters = {}, types = {}}, highlights = _6_, cmp_itemkind_reverse = false, end_of_buffer = false, terminal = false, visual_bold = false})
vim.o.background = "dark"
tairiki.load()
return require("lualine").setup({options = {theme = "tomorrow_night", component_separators = {left = "|", right = "|"}, section_separators = {left = "", right = ""}, globalstatus = true, icons_enabled = false}, sections = {lualine_a = {"mode"}, lualine_b = {"branch", "diff", "diagnostics"}, lualine_c = {"filename"}, lualine_x = {}, lualine_y = {"progress"}, lualine_z = {"location"}}})
