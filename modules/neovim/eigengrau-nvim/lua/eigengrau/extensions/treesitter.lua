local util = require("eigengrau.util")
local M = {}

--- @param opts eigengrau.Config
--- @param t eigengrau.Palette
function M.get(opts, t)
    opts = opts or {}
    local highlights = {
        -- ── Core ────────────────────────────────────────────────────────────
        ["@comment"]             = { fg = t.yellow, italic = opts.italic_comments },
        ["@comment.documentation"] = { fg = t.yellow, italic = opts.italic_comments },

        ["@variable"]            = { fg = t.fg },
        ["@variable.builtin"]    = { fg = t.cyan },
        ["@variable.parameter"]  = { fg = t.fg },
        ["@variable.member"]     = { fg = t.fg },

        ["@constant"]            = { fg = t.pink },
        ["@constant.builtin"]    = { fg = t.pink },
        ["@constant.macro"]      = { fg = t.red },

        -- ── Strings ─────────────────────────────────────────────────────────
        ["@string"]              = { fg = t.green },   -- steel blue (#86AEDA)
        ["@string.documentation"] = { fg = t.yellow, italic = true },
        ["@string.escape"]       = { fg = t.pink },
        ["@string.special"]      = { fg = t.pink },
        ["@string.regex"]        = { fg = t.pink },
        ["@character"]           = { fg = t.green },
        ["@character.special"]   = { fg = t.pink },

        -- ── Numbers / booleans ───────────────────────────────────────────────
        ["@number"]              = { fg = t.red },     -- #ff463b
        ["@number.float"]        = { fg = t.red },
        ["@boolean"]             = { fg = t.cyan },    -- #56d4de

        -- ── Functions ────────────────────────────────────────────────────────
        ["@function"]            = { fg = t.blue },    -- teal (#4db5bd)
        ["@function.builtin"]    = { fg = t.blue },
        ["@function.call"]       = { fg = t.blue },
        ["@function.macro"]      = { fg = t.red },     -- macros: red (#ff463b)
        ["@function.method"]     = { fg = t.blue },
        ["@function.method.call"] = { fg = t.blue },
        ["@constructor"]         = { fg = t.purple },  -- type blue (#aaccff)

        -- ── Keywords ─────────────────────────────────────────────────────────
        ["@keyword"]             = { fg = t.orange },  -- green (#86DA87)
        ["@keyword.function"]    = { fg = t.orange },
        ["@keyword.operator"]    = { fg = t.orange },
        ["@keyword.return"]      = { fg = t.orange },
        ["@keyword.coroutine"]   = { fg = t.orange },
        ["@keyword.type"]        = { fg = t.purple, italic = true },
        ["@keyword.modifier"]    = { fg = t.purple },  -- pub/mut/etc → type blue
        ["@keyword.import"]      = { fg = t.cyan },    -- use/import → namespace cyan
        ["@keyword.exception"]   = { fg = t.red },

        -- ── Types ────────────────────────────────────────────────────────────
        ["@type"]                = { fg = t.purple },  -- type blue (#aaccff)
        ["@type.builtin"]        = { fg = util.blend(t.purple, t.cyan, 0.6) },
        ["@type.definition"]     = { fg = t.purple },
        ["@type.qualifier"]      = { fg = t.orange },

        -- ── Namespaces / modules ─────────────────────────────────────────────
        ["@module"]              = { fg = t.cyan },    -- namespace cyan (#56d4de)
        ["@namespace"]           = { fg = t.cyan },
        ["@label"]               = { fg = t.orange },

        -- ── Attributes / annotations ─────────────────────────────────────────
        ["@attribute"]           = { fg = t.red },     -- #ff463b (macro/attribute red from Noctilux)
        ["@attribute.builtin"]   = { fg = t.red },
        ["@preproc"]             = { fg = t.red },
        ["@define"]              = { fg = t.red },

        -- ── Punctuation ──────────────────────────────────────────────────────
        ["@punctuation.bracket"]   = { fg = t.grey },  -- #7A8490
        ["@punctuation.delimiter"] = { fg = t.grey },
        ["@punctuation.special"]   = { fg = t.grey },

        -- ── Operators ────────────────────────────────────────────────────────
        ["@operator"]            = { fg = t.orange },  -- green (#86DA87)

        -- ── Tags (HTML/JSX) ──────────────────────────────────────────────────
        ["@tag"]                 = { fg = t.orange },
        ["@tag.attribute"]       = { fg = t.yellow },
        ["@tag.delimiter"]       = { fg = t.grey },

        -- ── Markup (markdown, etc.) ──────────────────────────────────────────
        ["@markup.heading.1"]    = { link = "markdownH1" },
        ["@markup.heading.2"]    = { link = "markdownH2" },
        ["@markup.heading.3"]    = { link = "markdownH3" },
        ["@markup.heading.4"]    = { link = "markdownH4" },
        ["@markup.heading.5"]    = { link = "markdownH5" },
        ["@markup.heading.6"]    = { link = "markdownH6" },
        ["@markup.italic"]       = { fg = t.green, italic = true },
        ["@markup.strong"]       = { fg = t.pink, bold = true },
        ["@markup.quote"]        = { fg = t.grey, italic = true },
        ["@markup.link.label"]   = { fg = t.orange },
        ["@markup.link.url"]     = { fg = t.blue, underline = true },
        ["@markup.link.label.markdown_inline"] = { fg = t.cyan },
        ["@markup.link.markdown_inline"]       = { fg = t.blue },
        ["@markup.list.checked"]   = { fg = t.orange, bold = true },
        ["@markup.list.unchecked"] = { fg = t.magenta, bold = true },
        ["@markup.raw"]          = { fg = t.cyan },
        ["@markup.raw.block"]    = { fg = t.cyan },

        -- ── Misc ─────────────────────────────────────────────────────────────
        ["@annotation"]          = { fg = t.red },
        ["@none"]                = { default = true },
        ["@conceal"]             = { fg = t.grey },
        ["@text"]                = { link = "@none" },
        ["@text.strong"]         = { bold = true },
        ["@text.emphasis"]       = { italic = true },
        ["@text.underline"]      = { underline = true },
        ["@text.strike"]         = { strikethrough = true },
        ["@text.uri"]            = { fg = t.blue, underline = true },
        ["@text.literal"]        = { fg = t.cyan },
        ["@text.reference"]      = { fg = t.pink },
        ["@text.todo"]           = { link = "Todo" },
        ["@text.note"]           = { fg = t.cyan, bold = true },
        ["@text.warning"]        = { fg = t.yellow, bold = true },
        ["@text.danger"]         = { fg = t.red, bold = true },
        ["@text.title"]          = { link = "markdownH1" },
        ["@text.title.2"]        = { link = "markdownH2" },
        ["@text.title.3"]        = { link = "markdownH3" },
        ["@text.title.4"]        = { link = "markdownH4" },
        ["@text.title.5"]        = { link = "markdownH5" },
        ["@text.math"]           = { fg = t.pink },
        ["@text.environment"]    = { link = "Macro" },
        ["@text.environment.name"] = { link = "Type" },

        -- ── Language-specific overrides ──────────────────────────────────────
        -- Rust: proc macros / derive attributes → red
        ["@attribute.rust"]      = { fg = t.red },
        -- Rust: lifetime → cyan
        ["@storageclass.lifetime.rust"] = { fg = t.cyan, italic = true },
        -- Rust: self → type blue
        ["@variable.builtin.rust"] = { fg = t.purple },
        -- Rust: use paths → cyan
        ["@include.rust"]        = { fg = t.cyan },
    }

    return highlights
end

return M
