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

-- Theme
vim.o.background = "light"

require('kanso').setup({
    bold = true,
    italics = false,
    compile = false,
    undercurl = true,
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = {},
    typeStyle = {},
    transparent = true,
    dimInactive = false,
    terminalColors = true,
    colors = {
        palette = {},
        theme = { zen = {}, pearl = {}, ink = {}, all = {} },
    },
    overrides = function(colors)
        return {
            -- Syntax: pragmata palette
            Comment                    = { fg = "#194E00" },
            ["@comment"]               = { fg = "#194E00" },
            String                     = { fg = "#56283c" },
            ["@string"]                = { fg = "#56283c" },
            ["@string.special"]        = { fg = "#56283c" },
            Character                  = { fg = "#56283c" },
            Keyword                    = { fg = "#000000", bold = true },
            ["@keyword"]               = { fg = "#000000", bold = true },
            ["@keyword.function"]      = { fg = "#000000", bold = true },
            ["@keyword.return"]        = { fg = "#000000", bold = true },
            Statement                  = { fg = "#000000", bold = true },
            Conditional                = { fg = "#000000", bold = true },
            Repeat                     = { fg = "#000000", bold = true },
            Function                   = { fg = "#000000" },
            ["@function"]              = { fg = "#000000" },
            ["@function.call"]         = { fg = "#000000" },
            ["@function.builtin"]      = { fg = "#000000", bold = true },
            Identifier                 = { fg = "#000000" },
            ["@variable"]              = { fg = "#000000" },
            ["@parameter"]             = { fg = "#000000" },
            Constant                   = { fg = "#1e73be" },
            ["@constant"]              = { fg = "#1e73be" },
            ["@constant.builtin"]      = { fg = "#1e73be" },
            Boolean                    = { fg = "#1e73be" },
            Number                     = { fg = "#1e73be" },
            Float                      = { fg = "#1e73be" },
            Type                       = { fg = "#1e73be" },
            ["@type"]                  = { fg = "#1e73be" },
            ["@type.builtin"]          = { fg = "#1e73be" },
            ["@property"]              = { fg = "#1e73be" },
            ["@variable.member"]       = { fg = "#1e73be" },
            Operator                   = { fg = "#e41507" },
            ["@operator"]              = { fg = "#e41507" },
            ["@punctuation"]           = { fg = "#e41507" },
            ["@punctuation.bracket"]   = { fg = "#e41507" },
            ["@punctuation.delimiter"] = { fg = "#e41507" },
            ["@punctuation.special"]   = { fg = "#e41507" },
            PreProc                    = { fg = "#e41507" },
            Special                    = { fg = "#e41507" },
            SpecialChar                = { fg = "#e41507" },
            Delimiter                  = { fg = "#e41507" },
            Error                      = { fg = "#e41507", bold = true },
            ErrorMsg                   = { fg = "#e41507", bold = true },
            Todo                       = { fg = "#e41507", bold = true },
            WarningMsg                 = { fg = "#E6BB00", bold = true },
            -- UI (transparent bg preserved)
            LineNr                     = { fg = "#606060", bg = "NONE" },
            CursorLineNr               = { fg = "#000000", bold = true, bg = "NONE" },
            SignColumn                 = { bg = "NONE" },
            FoldColumn                 = { bg = "NONE" },
            Visual                     = { bg = "#d0d0d0" },
            Search                     = { bg = "#e0e0e0", bold = true },
            IncSearch                  = { bg = "#a0a0a0", fg = "#ffffff" },
            CurSearch                  = { bg = "#a0a0a0", fg = "#ffffff" },
            MatchParen                 = { bg = "#e0e0e0", bold = true },
            -- Diff / GitSigns
            DiffAdd                    = { bg = "#e0ffe0", fg = "#194E00" },
            DiffDelete                 = { bg = "#ffe0e0", fg = "#e41507" },
            DiffChange                 = { bg = "#ffffe0", fg = "#9E7400" },
            DiffText                   = { bg = "#ffffe0", fg = "#9E7400", bold = true },
            GitSignsAdd                = { fg = "#194E00" },
            GitSignsChange             = { fg = "#9E7400" },
            GitSignsDelete             = { fg = "#e41507" },
            -- Splits / status
            WinSeparator               = { fg = "#e8e8e8", bg = "NONE" },
            VertSplit                  = { fg = "#e8e8e8", bg = "NONE" },
            StatusLine                 = { fg = "#000000", bg = "NONE" },
            StatusLineNC               = { fg = "#505050", bg = "NONE" },
            -- Pmenu / floats
            Pmenu                      = { fg = "#000000", bg = "NONE" },
            PmenuSel                   = { fg = "#000000", bg = "#d0d0d0", bold = true },
            PmenuSbar                  = { bg = "#e0e0e0" },
            PmenuThumb                 = { bg = "#a0a0a0" },
            NormalFloat                = { fg = "#000000", bg = "NONE" },
            FloatBorder                = { fg = "#d0d0d0", bg = "NONE" },
            -- Links / markup
            ["@text.uri"]              = { fg = "#2981ca", underline = true },
            ["@markup.link"]           = { fg = "#2981ca", underline = true },
            ["@markup.link.url"]       = { fg = "#2981ca", underline = true },
            -- nvim-tree
            NvimTreeNormal             = { bg = "NONE" },
            NvimTreeNormalNC           = { bg = "NONE" },
            NvimTreeWinSeparator       = { fg = "#e8e8e8", bg = "NONE" },
            NvimTreeFolderName         = { fg = "#2981ca", bold = true },
            NvimTreeOpenedFolderName   = { fg = "#2981ca", bold = true },
            NvimTreeFolderIcon         = { fg = "#2981ca" },
            NvimTreeRootFolder         = { fg = "#000000", bold = true },
            NvimTreeSymlink            = { fg = "#2E998E" },
            -- Telescope
            TelescopeNormal            = { bg = "NONE" },
            TelescopeBorder            = { fg = "#d0d0d0", bg = "NONE" },
            TelescopeSelection         = { bg = "#d0d0d0" },
            TelescopeMatching          = { fg = "#2981ca", bold = true },
            TelescopePromptPrefix      = { fg = "#2981ca", bold = true },
        }
    end,
    background = {
        dark = "ink",
        light = "pearl",
    },
    foreground = "saturated",
})

vim.cmd.colorscheme "kanso-pearl"
