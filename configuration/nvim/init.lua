vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.scriptencoding = "utf-8"

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.linespace = 2
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.isfname:append("@-@")

vim.keymap.set("n", "<ScrollWheelUp>", "k", { noremap = true, silent = true })
vim.keymap.set("n", "<ScrollWheelDown>", "j", { noremap = true, silent = true })
vim.keymap.set("n", "<ScrollWheelLeft>", "h", { noremap = true, silent = true })
vim.keymap.set("n", "<ScrollWheelRight>", "l", { noremap = true, silent = true })

vim.diagnostic.config({ virtual_text = true })

local function inlay_hints()
  vim.lsp.inlay_hint.enable()
end

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local wk = require("which-key")

wk.setup({})
wk.add({
  { "<leader>s", { group = "[S]earch" } },
  { "<leader>p", { group = "[P]roject" } },
})

vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "[P]roject [V]iew" })
vim.keymap.set("n", "<leader>pt", "<CMD>NvimTreeToggle<CR>", { desc = "[P]roject [T]ree" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Selection Up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Selection Down" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "[Y]ank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "[Y]ank line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next error" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous error" })

vim.keymap.set("n", "<C-s>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
  desc = "Make a file executable",
  silent = true,
})

vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, {
  desc = "[S]earch Recent Files ('.' for repeat)",
})
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>/", function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false }))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s/", function()
  builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
end, { desc = "[S]earch [/] in Open Files" })

vim.keymap.set("n", "<leader>sn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

vim.keymap.set("n", "<leader>u", function()
  vim.cmd("UndotreeToggle")
end, { desc = "[U]ndo tree" })

local cmp = require("cmp")
local luasnip = require("luasnip")

luasnip.config.setup({})
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = { completeopt = "menu,menuone,noinsert" },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<C-l>"] = cmp.mapping(function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
  },
})

require("conform").setup({
  format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
  formatters_by_ft = {
    scala = { "scalafmt" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
  },
})

local lsp_group = vim.api.nvim_create_augroup("lsp-attach", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(event)
    local function buffer_map(keys, action, description)
      vim.keymap.set("n", keys, action, {
        buffer = event.buf,
        desc = "LSP: " .. description,
      })
    end

    buffer_map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
    buffer_map("gr", builtin.lsp_references, "[G]oto [R]eferences")
    buffer_map("grr", builtin.lsp_references, "[G]oto [R]eferences")
    buffer_map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
    buffer_map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
    buffer_map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
    buffer_map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    buffer_map("<leader>rr", vim.lsp.buf.rename, "[R]ename")
    buffer_map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    buffer_map("K", vim.lsp.buf.hover, "Hover Documentation")
    buffer_map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    buffer_map("<leader>f", vim.lsp.buf.format, "[F]ormat")

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = lsp_group,
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = lsp_group,
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.api.nvim_create_autocmd("LspDetach", {
  group = lsp_group,
  callback = function()
    vim.lsp.buf.clear_references()
  end,
})

require("fidget").setup({ notification = { window = { winblend = 0 } } })

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config.elixirls = { capabilities = capabilities }
vim.lsp.config.metals = { capabilities = capabilities }
vim.lsp.config.nixd = {
  capabilities = capabilities,
  settings = { nixd = { formatting = { command = { "nixfmt" } } } },
}
vim.lsp.config.rust_analyzer = {
  capabilities = capabilities,
  on_attach = inlay_hints,
  settings = { ["rust-analyzer"] = { cargo = { features = "all" } } },
}
vim.lsp.config.ts_ls = { capabilities = capabilities }

vim.lsp.enable("elixirls")
vim.lsp.enable("metals")
vim.lsp.enable("nixd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("ts_ls")

require("Comment").setup({})
require("gitsigns").setup({})
require("nvim-surround").setup({})

require("oil").setup({
  default_file_explorer = true,
  delete_to_trash = true,
  columns = {},
  view_options = { show_hidden = true },
})

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = { width = 40, side = "right" },
  renderer = { group_empty = true },
  filters = { dotfiles = false },
  update_focused_file = { enable = true },
  hijack_netrw = false,
  on_attach = function(buffer)
    local api = require("nvim-tree.api")
    api.config.mappings.default_on_attach(buffer)
    vim.keymap.set("n", "<LeftRelease>", api.node.open.edit, {
      buffer = buffer,
      noremap = true,
      silent = true,
    })
  end,
})

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local tree_windows = {}
    local floating_windows = {}
    local windows = vim.api.nvim_list_wins()

    for _, window in ipairs(windows) do
      local buffer_name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(window))
      local window_config = vim.api.nvim_win_get_config(window)
      if buffer_name:match("NvimTree_") then
        table.insert(tree_windows, window)
      end
      if window_config.relative ~= "" then
        table.insert(floating_windows, window)
      end
    end

    if #windows - #floating_windows - #tree_windows == 1 then
      for _, window in ipairs(tree_windows) do
        vim.api.nvim_win_close(window, true)
      end
    end
  end,
})

local telescope = require("telescope")

telescope.setup({
  defaults = { file_ignore_patterns = { "node_modules/.*", ".git/.*" } },
  pickers = {
    find_files = { find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" } },
    grep_string = { additional_args = { "--hidden" } },
    live_grep = { additional_args = { "--hidden" } },
  },
  extensions = { ["ui-select"] = themes.get_dropdown() },
})

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")

require("nvim-treesitter").setup({
  highlight = { enable = true, additional_vim_regex_highlighting = true },
  indent = { enable = true },
})

require("render-markdown").setup({
  win_options = { wrap = { rendered = true, default = false } },
  heading = { backgrounds = {} },
})

vim.o.background = "dark"
require("poimandres").setup({
  disable_background = true,
  disable_float_background = true,
})
vim.cmd.colorscheme("poimandres")

vim.api.nvim_set_hl(0, "Comment", { fg = "#506477" })
vim.api.nvim_set_hl(0, "SpecialComment", { fg = "#506477" })

for _, group in ipairs({ "LspReferenceText", "LspReferenceRead", "LspReferenceWrite" }) do
  vim.api.nvim_set_hl(0, group, { fg = "#171922", bg = "#ADD7FF" })
end
