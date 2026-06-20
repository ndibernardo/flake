local builtin        = require 'telescope.builtin'
local wk             = require 'which-key'
local cmp            = require 'cmp'
local luasnip        = require 'luasnip'

local map            = vim.keymap
local opt            = vim.opt

vim.g.mapleader      = " "
vim.g.maplocalleader = " "

vim.scriptencoding   = "utf-8"
opt.encoding         = "utf-8"
opt.fileencoding     = "utf-8"

opt.nu               = true
opt.relativenumber   = true
opt.cursorline       = true
opt.cursorlineopt    = "number"

opt.tabstop          = 2
opt.softtabstop      = 2
opt.shiftwidth       = 2
opt.expandtab        = true
opt.linespace        = 2

opt.title            = true
opt.autoindent       = true
opt.smartindent      = true

opt.wrap             = false

opt.swapfile         = false
opt.backup           = false
opt.undodir          = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile         = true

opt.hlsearch         = false
opt.incsearch        = true

opt.guicursor        = ""
opt.termguicolors    = true

opt.scrolloff        = 8
opt.updatetime       = 50

opt.isfname:append("@-@")

vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelLeft>', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelRight>', 'l', { noremap = true, silent = true })

vim.diagnostic.config({ virtual_text = true })

-- Remaps
wk.add({
    { "<leader>s", group = "[S]earch" },
    { "<leader>p", group = "[P]roject" },
})

map.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "[P]roject [V]iew" })
map.set("n", "<leader>pt", "<CMD>NvimTreeToggle<CR>", { desc = "[P]roject [T]ree" })
map.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Selection Up" })
map.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Selection Down" })
map.set("n", "J", "mzJ`z")
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")
map.set("x", "<leader>p", [["_dP]])
map.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[y]ank to clipboard" })
map.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank line to clipboard" })
map.set({ "n", "v" }, "<leader>d", [["_d]])
map.set("i", "<C-c>", "<Esc>")
map.set("n", "Q", "<nop>")
map.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map.set("n", "<C-k>", "<cmd>cnext<CR>zz")
map.set("n", "<C-j>", "<cmd>cprev<CR>zz")
map.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next error" })
map.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous error" })
map.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make a file executable", silent = true })

map.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
map.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
map.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
map.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
map.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
map.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
map.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

map.set("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })

map.set("n", "<leader>s/", function()
    builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
    })
end, { desc = "[S]earch [/] in Open Files" })

map.set("n", "<leader>sn", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })


map.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })

-- Plugins

-- Colorizer
require 'colorizer'.setup()

-- Completion
luasnip.config.setup {}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = { completeopt = 'menu,menuone,noinsert' },

    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<tab>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    },
}
-- Conform
require("conform").setup({
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local map_lsp = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map_lsp("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map_lsp("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map_lsp("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map_lsp("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
        map_lsp("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        map_lsp(
            "<leader>ws",
            require("telescope.builtin").lsp_dynamic_workspace_symbols,
            "[W]orkspace [S]ymbols"
        )
        map_lsp("<leader>rr", vim.lsp.buf.rename, "[R]e[n]ame")
        map_lsp("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map_lsp("K", vim.lsp.buf.hover, "Hover Documentation")
        map_lsp("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map_lsp("<leader>f", vim.lsp.buf.format, "[F]ormat")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            -- client.server_capabilities.semanticTokensProvider = nil
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

require("fidget").setup {
    notification = {
        window = {
            winblend = 0,
        },
    },
}

vim.lsp.enable({ 'lua_ls', 'nixd', 'rust_analyzer', 'zls' })
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config['rust_analyzer'] = {
    on_attach = function()
        vim.lsp.inlay_hint.enable()
    end,
    capabilities = lsp_capabilities,
    settings = {}
}

vim.lsp.config['lua_ls'] = {
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                ignoreDir = {
                    'result',
                    '.direnv'
                },
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

vim.lsp.config['nixd'] = {
    capabilities = lsp_capabilities,
    settings = {
        nixd = {
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
}


vim.lsp.config['zls'] = {
    capabilities = lsp_capabilities,
    root_markers = { ".git", { "build.zig", "zls.json" } },
    settings = {
        zls = {
            enable_inlay_hints = true,
            enable_snippets = true,
            warn_style = true,
        },
    },
}

require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
    columns = {},
    view_options = {
        show_hidden = true,
    }
})


-- Nvim-tree
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<LeftRelease>", api.node.open.edit, { buffer = bufnr, noremap = true, silent = true })
    end,
})

-- Telescope
require("telescope").setup({
    defaults = {
        -- vimgrep_arguments = vimgrep_arguments,
        file_ignore_patterns = {
            "node_modules/.*",
            ".git/.*"
        }
    },
    pickers = {
        find_files = {
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--glob",
                "!**/.git/*"
            },
        },
        grep_string = {
            additional_args = { "--hidden" }
        },
        live_grep = {
            additional_args = { "--hidden" }
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
        },
    },
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")


-- Treesitter
require("nvim-treesitter").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
})

-- Theme: pragmata
vim.o.background = "light"
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.g.colors_name = "pragmata"

local p = {
    bg        = "NONE",
    bg_dim    = "#eeeeee",
    bg_alt    = "#ececec",
    bg_high   = "#e8e8e8",
    bg_sel    = "#e0e0e0",
    bg_strong = "#d0d0d0",
    border    = "#d0d0d0",
    fg        = "#000000",
    fg_alt    = "#404040",
    fg_muted  = "#505050",
    fg_dim    = "#606060",
    blue      = "#2981ca",
    blue_dark = "#1e73be",
    green     = "#194E00",
    green_alt = "#329033",
    red       = "#e41507",
    orange    = "#ff5000",
    yellow    = "#E6BB00",
    burgundy  = "#56283c",
    purple    = "#9805AE",
    teal      = "#2E998E",
}

local function hl(group, spec) vim.api.nvim_set_hl(0, group, spec) end

-- Editor
hl("Normal", { fg = p.fg, bg = p.bg })
hl("NormalNC", { fg = p.fg, bg = p.bg })
hl("NormalFloat", { fg = p.fg, bg = p.bg })
hl("FloatBorder", { fg = p.border, bg = p.bg })
hl("CursorLine", { bg = p.bg_dim })
hl("CursorLineNr", { fg = p.fg, bold = true })
hl("LineNr", { fg = p.fg_dim })
hl("SignColumn", { bg = p.bg })
hl("FoldColumn", { bg = p.bg })
hl("ColorColumn", { bg = p.bg_dim })
hl("Visual", { bg = p.bg_strong })
hl("VisualNOS", { bg = p.bg_strong })
hl("Search", { bg = p.orange, fg = p.fg })
hl("IncSearch", { bg = p.orange, fg = p.fg, bold = true })
hl("CurSearch", { bg = p.orange, fg = p.fg, bold = true })
hl("MatchParen", { bg = p.bg_sel, bold = true })
hl("WinSeparator", { fg = p.bg_high, bg = p.bg })
hl("VertSplit", { fg = p.bg_high, bg = p.bg })
hl("StatusLine", { fg = p.fg, bg = p.bg_high })
hl("StatusLineNC", { fg = p.fg_muted, bg = p.bg_alt })
hl("TabLine", { fg = p.fg_muted, bg = p.bg_alt })
hl("TabLineSel", { fg = p.fg, bg = p.bg, bold = true })
hl("TabLineFill", { bg = p.bg_alt })
hl("Pmenu", { fg = p.fg, bg = p.bg_high })
hl("PmenuSel", { fg = p.fg, bg = p.orange, bold = true })
hl("PmenuSbar", { bg = p.bg_sel })
hl("PmenuThumb", { bg = p.fg_dim })
hl("WildMenu", { fg = p.fg, bg = p.orange })
hl("Directory", { fg = p.blue, bold = true })
hl("Title", { fg = p.fg, bold = true })
hl("Question", { fg = p.blue })
hl("ModeMsg", { fg = p.fg, bold = true })
hl("MoreMsg", { fg = p.green_alt })
hl("EndOfBuffer", { fg = p.bg })
hl("NonText", { fg = p.fg_dim })
hl("SpecialKey", { fg = p.fg_dim })
hl("Whitespace", { fg = p.bg_strong })
hl("Conceal", { fg = p.fg_dim })
hl("Folded", { fg = p.fg_muted, bg = p.bg_dim })
hl("Error", { fg = p.red, bold = true })
hl("ErrorMsg", { fg = p.red, bold = true })
hl("WarningMsg", { fg = p.orange, bold = true })

-- Syntax
hl("Comment", { fg = p.green })
hl("String", { fg = p.burgundy })
hl("Character", { fg = p.burgundy })
hl("Constant", { fg = p.blue_dark })
hl("Boolean", { fg = p.blue_dark })
hl("Number", { fg = p.blue_dark })
hl("Float", { fg = p.blue_dark })
hl("Identifier", { fg = p.fg })
hl("Function", { fg = p.fg })
hl("Statement", { fg = p.fg, bold = true })
hl("Conditional", { fg = p.fg, bold = true })
hl("Repeat", { fg = p.fg, bold = true })
hl("Label", { fg = p.fg, bold = true })
hl("Keyword", { fg = p.fg, bold = true })
hl("Exception", { fg = p.red, bold = true })
hl("Operator", { fg = p.red })
hl("PreProc", { fg = p.red })
hl("Include", { fg = p.red })
hl("Define", { fg = p.red })
hl("Macro", { fg = p.red })
hl("PreCondit", { fg = p.red })
hl("Type", { fg = p.blue_dark })
hl("StorageClass", { fg = p.blue_dark })
hl("Structure", { fg = p.blue_dark })
hl("Typedef", { fg = p.blue_dark })
hl("Special", { fg = p.red })
hl("SpecialChar", { fg = p.red })
hl("Tag", { fg = p.blue })
hl("Delimiter", { fg = p.red })
hl("SpecialComment", { fg = p.green, italic = true })
hl("Debug", { fg = p.orange })
hl("Underlined", { underline = true })
hl("Todo", { fg = p.orange, bold = true })

-- Treesitter
hl("@comment", { link = "Comment" })
hl("@string", { link = "String" })
hl("@string.special", { fg = p.burgundy })
hl("@character", { link = "Character" })
hl("@number", { link = "Number" })
hl("@boolean", { link = "Boolean" })
hl("@float", { link = "Float" })
hl("@constant", { link = "Constant" })
hl("@constant.builtin", { fg = p.blue_dark, bold = true })
hl("@variable", { fg = p.fg })
hl("@variable.builtin", { fg = p.fg, bold = true })
hl("@parameter", { fg = p.fg })
hl("@field", { fg = p.fg })
hl("@property", { fg = p.fg })
hl("@function", { fg = p.fg })
hl("@function.call", { fg = p.fg })
hl("@function.builtin", { fg = p.fg, bold = true })
hl("@function.macro", { fg = p.red })
hl("@method", { fg = p.fg })
hl("@method.call", { fg = p.fg })
hl("@constructor", { fg = p.blue_dark })
hl("@keyword", { fg = p.fg, bold = true })
hl("@keyword.function", { fg = p.fg, bold = true })
hl("@keyword.return", { fg = p.fg, bold = true })
hl("@keyword.operator", { fg = p.red })
hl("@conditional", { fg = p.fg, bold = true })
hl("@repeat", { fg = p.fg, bold = true })
hl("@type", { fg = p.blue_dark })
hl("@type.builtin", { fg = p.blue_dark, bold = true })
hl("@type.definition", { fg = p.blue_dark, bold = true })
hl("@operator", { fg = p.red })
hl("@punctuation", { fg = p.red })
hl("@punctuation.bracket", { fg = p.red })
hl("@punctuation.delimiter", { fg = p.red })
hl("@punctuation.special", { fg = p.red })
hl("@tag", { fg = p.blue })
hl("@tag.attribute", { fg = p.blue_dark })
hl("@text.uri", { fg = p.blue, underline = true })
hl("@markup.link", { fg = p.blue, underline = true })
hl("@markup.link.url", { fg = p.blue, underline = true })
hl("@markup.heading", { fg = p.fg, bold = true })

-- Diagnostics
hl("DiagnosticError", { fg = p.red })
hl("DiagnosticWarn", { fg = p.orange })
hl("DiagnosticInfo", { fg = p.blue })
hl("DiagnosticHint", { fg = p.teal })
hl("DiagnosticOk", { fg = p.green_alt })
hl("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.orange })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.blue })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.teal })
hl("DiagnosticVirtualTextError", { fg = p.red, bg = p.bg })
hl("DiagnosticVirtualTextWarn", { fg = p.orange, bg = p.bg })
hl("DiagnosticVirtualTextInfo", { fg = p.blue, bg = p.bg })
hl("DiagnosticVirtualTextHint", { fg = p.teal, bg = p.bg })

-- LSP
hl("LspReferenceText", { bg = p.bg_sel })
hl("LspReferenceRead", { bg = p.bg_sel })
hl("LspReferenceWrite", { bg = p.bg_sel, underline = true })
hl("LspInlayHint", { fg = p.fg_dim })
hl("LspSignatureActiveParameter", { fg = p.orange, bold = true })

-- Diff / GitSigns
hl("DiffAdd", { bg = "#e0ffe0", fg = p.green })
hl("DiffDelete", { bg = "#ffe0e0", fg = p.red })
hl("DiffChange", { bg = "#ffffe0", fg = p.orange })
hl("DiffText", { bg = "#ffffe0", fg = p.orange, bold = true })
hl("GitSignsAdd", { fg = p.green })
hl("GitSignsChange", { fg = p.orange })
hl("GitSignsDelete", { fg = p.red })
hl("GitSignsAddNr", { fg = p.green })
hl("GitSignsChangeNr", { fg = p.orange })
hl("GitSignsDeleteNr", { fg = p.red })

-- nvim-tree
hl("NvimTreeNormal", { fg = p.fg, bg = p.bg })
hl("NvimTreeNormalNC", { fg = p.fg, bg = p.bg })
hl("NvimTreeWinSeparator", { fg = p.bg_high, bg = p.bg })
hl("NvimTreeFolderName", { fg = p.blue, bold = true })
hl("NvimTreeOpenedFolderName", { fg = p.blue, bold = true })
hl("NvimTreeEmptyFolderName", { fg = p.fg_muted })
hl("NvimTreeFolderIcon", { fg = p.blue })
hl("NvimTreeOpenedFile", { fg = p.fg, bold = true })
hl("NvimTreeRootFolder", { fg = p.fg, bold = true })
hl("NvimTreeSymlink", { fg = p.teal })
hl("NvimTreeExecFile", { fg = p.green_alt })
hl("NvimTreeSpecialFile", { fg = p.orange })
hl("NvimTreeGitDirty", { fg = p.orange })
hl("NvimTreeGitNew", { fg = p.green })
hl("NvimTreeGitDeleted", { fg = p.red })
hl("NvimTreeIndentMarker", { fg = p.bg_strong })

-- Telescope
hl("TelescopeNormal", { fg = p.fg, bg = p.bg })
hl("TelescopeBorder", { fg = p.border, bg = p.bg })
hl("TelescopePromptNormal", { fg = p.fg, bg = p.bg_dim })
hl("TelescopePromptBorder", { fg = p.border, bg = p.bg_dim })
hl("TelescopePromptTitle", { fg = "#f5f5f5", bg = p.orange, bold = true })
hl("TelescopePromptPrefix", { fg = p.orange, bold = true })
hl("TelescopePromptCounter", { fg = p.fg_dim })
hl("TelescopeResultsTitle", { fg = p.fg_muted })
hl("TelescopePreviewTitle", { fg = p.fg_muted })
hl("TelescopeSelection", { fg = p.fg, bg = p.bg_sel })
hl("TelescopeSelectionCaret", { fg = p.orange, bg = p.bg_sel })
hl("TelescopeMultiSelection", { fg = p.fg })
hl("TelescopeMatching", { fg = p.orange, bold = true })

-- which-key
hl("WhichKey", { fg = p.green_alt })
hl("WhichKeyGroup", { fg = p.fg, bold = true })
hl("WhichKeyDesc", { fg = p.fg })
hl("WhichKeySeparator", { fg = p.fg_dim })
hl("WhichKeyFloat", { bg = p.bg })

-- Fidget
hl("FidgetTitle", { fg = p.orange, bold = true })
hl("FidgetTask", { fg = p.fg_muted })

-- Terminal
vim.g.terminal_color_0  = "#f5f5f5"
vim.g.terminal_color_1  = p.red
vim.g.terminal_color_2  = p.green_alt
vim.g.terminal_color_3  = p.orange
vim.g.terminal_color_4  = p.blue
vim.g.terminal_color_5  = p.purple
vim.g.terminal_color_6  = p.teal
vim.g.terminal_color_7  = p.fg
vim.g.terminal_color_8  = p.fg_dim
vim.g.terminal_color_9  = p.red
vim.g.terminal_color_10 = p.green_alt
vim.g.terminal_color_11 = p.yellow
vim.g.terminal_color_12 = p.blue_dark
vim.g.terminal_color_13 = p.purple
vim.g.terminal_color_14 = p.teal
vim.g.terminal_color_15 = p.fg
