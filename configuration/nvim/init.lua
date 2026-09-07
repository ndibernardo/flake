vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.scriptencoding = "utf-8"

local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  number = true,
  relativenumber = true,
  cursorline = true,
  cursorlineopt = "number",
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  linespace = 2,
  title = true,
  autoindent = true,
  smartindent = true,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,
  incsearch = true,
  guicursor = "",
  termguicolors = true,
  scrolloff = 8,
  updatetime = 50,
  backup = false,
  hlsearch = false,
  swapfile = false,
  wrap = false,
}

for name, value in pairs(options) do
  vim.opt[name] = value
end

vim.opt.isfname:append("@-@")

for lhs, rhs in pairs({
  ["<ScrollWheelUp>"] = "k",
  ["<ScrollWheelDown>"] = "j",
  ["<ScrollWheelLeft>"] = "h",
  ["<ScrollWheelRight>"] = "l",
}) do
  vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true })
end

vim.diagnostic.config({ virtual_text = true })

local function inlay_hints()
  vim.lsp.inlay_hint.enable()
end

local languages = {
  {
    filetype = "clojure",
    conjure = true,
    formatter = "cljfmt",
    lsp = { "clojure_lsp", {} },
  },
  {
    filetype = "elixir",
    lsp = { "elixirls", {} },
  },
  {
    filetype = "fennel",
    conjure = true,
    formatter = "fnlfmt",
    lsp = { "fennel_ls", {} },
  },
  {
    filetype = "fsharp",
    lsp = { "fsautocomplete", {} },
  },
  {
    filetype = "go",
    lsp = {
      "gopls",
      {
        on_attach = inlay_hints,
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      },
    },
  },
  {
    filetype = "lua",
    lsp = {
      "lua_ls",
      {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim", "require" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              ignoreDir = { "result", ".direnv" },
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      },
    },
  },
  {
    filetype = "nix",
    lsp = {
      "nixd",
      { settings = { nixd = { formatting = { command = { "nixfmt" } } } } },
    },
  },
  {
    filetype = "ocaml",
    lsp = { "ocamllsp", {} },
  },
  {
    filetype = "python",
    lsp = {
      "pyright",
      { settings = { python = { analysis = { typeCheckingMode = "basic" } } } },
    },
  },
  {
    filetype = "rust",
    lsp = {
      "rust_analyzer",
      {
        on_attach = inlay_hints,
        settings = { ["rust-analyzer"] = { cargo = { features = "all" } } },
      },
    },
  },
  {
    filetype = "zig",
    lsp = {
      "zls",
      {
        root_markers = { ".git", { "build.zig", "zls.json" } },
        settings = {
          zls = {
            enable_inlay_hints = true,
            enable_snippets = true,
            warn_style = true,
          },
        },
      },
    },
  },
  {
    filetype = "lisp",
    conjure = true,
  },
}

local lsp_servers = {}
local formatters_by_filetype = {}
local conjure_filetypes = {}

for _, language in ipairs(languages) do
  if language.lsp then
    table.insert(lsp_servers, language.lsp)
  end
  if language.formatter then
    formatters_by_filetype[language.filetype] = { language.formatter }
  end
  if language.conjure then
    table.insert(conjure_filetypes, language.filetype)
  end
end

for name, value in pairs({
  ["conjure#filetypes"] = conjure_filetypes,
  ["conjure#log#hud#enabled"] = true,
  ["conjure#log#hud#anchor"] = "SE",
  ["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true,
  ["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true,
  ["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = "bb nrepl-server localhost:$port",
  ["conjure#client#common_lisp#swank#connection#default_host"] = "127.0.0.1",
  ["conjure#client#common_lisp#swank#connection#default_port"] = "4005",
}) do
  vim.g[name] = value
end

vim.g.parinfer_mode = "smart"
vim.g.parinfer_filetypes = conjure_filetypes

local swank_job = nil

local function start_swank()
  if swank_job then
    vim.notify("The Conjure SBCL/Swank job is already running", vim.log.levels.INFO)
    return
  end

  local job = vim.fn.jobstart({ "conjure-sbcl" }, {
    detach = false,
    on_exit = function(_, code)
      swank_job = nil
      if code ~= 0 then
        vim.schedule(function()
          vim.notify("SBCL/Swank exited with code " .. code, vim.log.levels.ERROR)
        end)
      end
    end,
  })

  if job > 0 then
    swank_job = job
    vim.notify("Starting SBCL/Swank on 127.0.0.1:4005", vim.log.levels.INFO)
    vim.defer_fn(function()
      pcall(vim.cmd, "ConjureConnect 127.0.0.1 4005")
    end, 750)
  else
    vim.notify("Unable to start conjure-sbcl", vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_user_command("ConjureSwank", start_swank, {
  desc = "Start SBCL/Swank and connect Conjure",
})

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local wk = require("which-key")

wk.setup({})
wk.add({
  { "<leader>s", { group = "[S]earch" } },
  { "<leader>p", { group = "[P]roject" } },
  { "<localleader>c", { group = "[C]onjure" } },
})

vim.keymap.set("n", "<localleader>cS", start_swank, { desc = "[C]onjure start [S]wank" })

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
    { name = "conjure" },
    { name = "luasnip" },
    { name = "path" },
  },
})

require("conform").setup({
  format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
  formatters_by_ft = formatters_by_filetype,
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
local enabled_servers = {}

for _, entry in ipairs(lsp_servers) do
  local server, server_options = entry[1], entry[2]
  table.insert(enabled_servers, server)
  vim.lsp.config[server] = vim.tbl_deep_extend("force", { capabilities = capabilities }, server_options)
end

vim.lsp.enable(enabled_servers)

require("colorizer").setup({})
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

for _, extension in ipairs({ "fzf", "ui-select" }) do
  pcall(telescope.load_extension, extension)
end

require("nvim-treesitter").setup({
  highlight = { enable = true, additional_vim_regex_highlighting = true },
  indent = { enable = true },
})

require("render-markdown").setup({
  win_options = { wrap = { rendered = true, default = false } },
  heading = { backgrounds = {} },
})

vim.o.background = "dark"

require("tokyonight").setup({
  style = "night",
  transparent = true,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    functions = {},
    variables = {},
    sidebars = "transparent",
    floats = "transparent",
  },
  on_highlights = function(highlights, colors)
    for _, group in ipairs({
      "@variable",
      "@variable.member",
      "@variable.parameter",
      "@property",
      "@parameter",
      "@field",
      "Identifier",
    }) do
      highlights[group] = { fg = colors.fg }
    end
  end,
})

vim.cmd.colorscheme("tokyonight")

local transparent_groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "FloatBorder",
  "FloatTitle",
  "SignColumn",
  "LineNr",
  "CursorLineNr",
  "EndOfBuffer",
  "FoldColumn",
  "MsgArea",
  "StatusLine",
  "StatusLineNC",
  "TabLine",
  "TabLineFill",
  "WinBar",
  "WinBarNC",
  "WinSeparator",
  "Pmenu",
  "PmenuSbar",
  "TelescopeNormal",
  "TelescopeBorder",
  "NvimTreeNormal",
  "NvimTreeNormalNC",
  "NvimTreeWinSeparator",
  "NvimTreeEndOfBuffer",
}

local function make_transparent()
  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", vim.api.nvim_get_hl(0, {
      name = group,
      link = false,
    }), { bg = "NONE", ctermbg = "NONE" }))
  end
end

make_transparent()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("transparent-background", { clear = true }),
  callback = make_transparent,
})

for name, definition in pairs(vim.api.nvim_get_hl(0, {})) do
  if definition.italic then
    definition.italic = false
    vim.api.nvim_set_hl(0, name, definition)
  end
end

require("lualine").setup({
  options = {
    theme = "auto",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    globalstatus = true,
    icons_enabled = false,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
