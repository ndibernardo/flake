local util = require("eigengrau.util")
local M = {}

--- @param opts eigengrau.Config
--- @param t eigengrau.Palette
function M.get(opts, t)
    opts = opts or {}
    local highlights = {
        -- ── Editor chrome ────────────────────────────────────────────────────
        Normal         = { fg = t.fg,   bg = t.bg },
        NormalNC       = { fg = t.fg,   bg = t.bg },
        NormalFloat    = { fg = t.fg,   bg = t.bg_alt },
        FloatTitle     = { fg = t.cyan, bg = t.bg_alt },
        FloatBorder    = { fg = t.bg_highlight, bg = t.bg_alt },

        ColorColumn    = { bg = t.bg_highlight },
        Conceal        = { fg = t.grey },
        Cursor         = { fg = t.bg,  bg = t.fg },
        ICursor        = { fg = t.bg,  bg = t.fg },
        CursorIM       = { fg = t.bg,  bg = t.fg },
        CursorColumn   = { bg = t.bg_highlight },
        CursorLine     = { bg = t.bg_highlight },
        Directory      = { fg = t.purple },
        EndOfBuffer    = { fg = util.blend(t.bg_highlight, t.fg, 0.9) },
        ErrorMsg       = { fg = t.red },

        VertSplit      = { fg = t.bg_highlight, bg = t.bg },
        WinSeparator   = { fg = t.bg_highlight, bg = t.bg },

        Folded         = { fg = t.grey, bg = t.bg },
        FoldColumn     = { fg = t.grey, bg = t.bg },
        SignColumn     = { fg = t.grey, bg = t.bg },
        SignColumnSB   = { fg = t.grey, bg = t.bg },

        Substitute     = { fg = t.red, bg = t.bg_highlight },
        LineNr         = { fg = util.blend(t.bg_highlight, "#3a3a48", 0.2) },
        CursorLineNr   = { fg = "#c8c8c8" },

        MatchParen     = { fg = t.cyan, bg = t.bg_highlight, bold = true },
        ModeMsg        = { fg = t.fg },
        MsgArea        = { fg = t.fg },
        MoreMsg        = { fg = t.purple },
        NonText        = { fg = util.blend(t.bg_solid, t.grey, 0.55) },

        Pmenu          = { fg = t.fg,  bg = t.bg_alt },
        PmenuSel       = { fg = t.fg,  bg = t.bg_highlight },
        PmenuSbar      = { fg = t.bg,  bg = t.bg_highlight },
        PmenuThumb     = { fg = t.bg,  bg = t.grey },
        PmenuMatch     = { fg = t.cyan, bg = t.bg_alt },
        PmenuMatchSel  = { fg = t.cyan, bg = t.bg_highlight },

        Question       = { fg = t.yellow },
        QuickFixLine   = { bg = t.bg_highlight },

        Search         = { fg = t.bg_alt, bg = t.fg },
        IncSearch      = { fg = t.bg_alt, bg = t.cyan },
        CurSearch      = { fg = t.bg_alt, bg = t.cyan },

        SpecialKey     = { fg = t.grey },
        SpellBad       = { sp = t.red,     undercurl = true },
        SpellCap       = { sp = t.yellow,  undercurl = true },
        SpellLocal     = { sp = t.purple,  undercurl = true },
        SpellRare      = { sp = t.pink,    undercurl = true },

        StatusLine     = { fg = t.fg,   bg = t.bg },
        StatusLineNC   = { fg = t.grey, bg = t.bg },

        TabLine        = { fg = t.grey, bg = t.bg_alt },
        TabLineFill    = { fg = t.grey, bg = t.bg_alt },
        TabLineSel     = { fg = t.fg,   bg = t.bg },

        WinBar         = { fg = t.fg,   bg = t.bg },
        WinBarNC       = { fg = t.grey, bg = t.bg },

        Title          = { fg = t.purple, bold = true },
        Visual         = { bg = t.bg_highlight },
        VisualNOS      = { bg = t.bg_highlight },
        WarningMsg     = { fg = t.yellow },
        Whitespace     = { fg = t.bg_highlight },
        WildMenu       = { fg = t.bg, bg = t.purple },

        -- ── Syntax: base vim groups ──────────────────────────────────────────
        -- Comments → warm yellow (#DADA86)
        Comment        = { fg = t.yellow, italic = opts.italic_comments },

        -- Constants / literals
        Constant       = { fg = t.pink },       -- violet (#B286DB)
        String         = { fg = t.green },       -- steel blue (#86AEDA)
        Character      = { fg = t.green },
        Boolean        = { fg = t.cyan },        -- namespace cyan (#56d4de)
        Number         = { fg = t.red },         -- red (#ff463b)
        Float          = { fg = t.red },

        -- Identifiers
        Identifier     = { fg = t.fg },
        Function       = { fg = t.blue },        -- teal (#4db5bd)

        -- Statements / control flow
        Statement      = { fg = t.fg },
        Conditional    = { fg = t.orange },      -- keywords: green (#86DA87)
        Repeat         = { fg = t.orange },
        Label          = { fg = t.orange },
        Operator       = { fg = t.orange },      -- operators: green (#86DA87)
        Keyword        = { fg = t.orange },      -- keywords: green (#86DA87)
        Exception      = { fg = t.red },

        -- Preprocessor / macros
        PreProc        = { fg = t.cyan },        -- namespace cyan
        Include        = { fg = t.cyan },
        Define         = { fg = t.red },         -- macros: red (#ff463b)
        Macro          = { fg = t.red },
        PreCondit      = { fg = t.red },

        -- Types
        Type           = { fg = t.purple },      -- type blue (#aaccff)
        StorageClass   = { fg = t.purple },
        Structure      = { fg = t.purple },
        Typedef        = { fg = t.purple },

        -- Special
        Special        = { fg = t.pink },
        SpecialChar    = { fg = t.pink },
        Tag            = { fg = t.orange },
        Delimiter      = { fg = t.grey },        -- punctuation: grey (#7A8490)
        SpecialComment = { fg = t.yellow, italic = opts.italic_comments },
        Debug          = { fg = t.red },

        -- Misc
        Underlined     = { underline = true },
        Bold           = { bold = true },
        Italic         = { italic = true },
        Ignore         = { fg = t.grey },
        Error          = { fg = t.red },
        Todo           = { fg = t.bg, bg = t.yellow, bold = true },

        -- ── Diff ────────────────────────────────────────────────────────────
        DiffAdd        = { bg = util.blend(t.bg_solid, t.orange, 0.85) },
        DiffChange     = { bg = util.blend(t.bg_solid, t.purple, 0.85) },
        DiffDelete     = { bg = util.blend(t.bg_solid, t.red, 0.85) },
        DiffText       = { bg = util.blend(t.bg_solid, t.cyan, 0.85) },
        Added          = { fg = t.orange },
        Removed        = { fg = t.red },

        -- ── Quickfix ────────────────────────────────────────────────────────
        qfLineNr       = { fg = t.grey },
        qfFileName     = { fg = t.purple },

        -- ── Markdown ────────────────────────────────────────────────────────
        markdownHeadingDelimiter = { fg = t.grey },
        markdownCode             = { fg = t.cyan },
        markdownCodeBlock        = { fg = t.cyan },
        markdownH1               = { fg = t.purple, bold = true },
        markdownH2               = { fg = t.cyan,   bold = true },
        markdownH3               = { fg = t.blue,   bold = true },
        markdownH4               = { fg = t.pink,   bold = true },
        markdownH5               = { fg = t.magenta,bold = true },
        markdownH6               = { fg = t.orange, bold = true },
        markdownLinkText         = { fg = t.blue, underline = true },

        -- ── LSP ─────────────────────────────────────────────────────────────
        LspReferenceText           = { bg = t.bg_highlight },
        LspReferenceRead           = { bg = t.bg_highlight },
        LspReferenceWrite          = { bg = t.bg_highlight },
        LspCodeLens                = { fg = t.grey },
        LspInlayHint               = { fg = t.grey, bg = "NONE" },
        LspSignatureActiveParameter = { fg = t.orange },
        LspInfoBorder              = { fg = t.bg_highlight },

        -- ── Diagnostics ─────────────────────────────────────────────────────
        DiagnosticError            = { fg = t.red },
        DiagnosticWarn             = { fg = t.yellow },
        DiagnosticInfo             = { fg = t.purple },
        DiagnosticHint             = { fg = t.cyan },
        DiagnosticUnnecessary      = { fg = t.grey },

        DiagnosticVirtualTextError = { fg = t.red },
        DiagnosticVirtualTextWarn  = { fg = t.yellow },
        DiagnosticVirtualTextInfo  = { fg = t.purple },
        DiagnosticVirtualTextHint  = { fg = t.cyan },

        DiagnosticUnderlineError   = { undercurl = true, sp = t.red },
        DiagnosticUnderlineWarn    = { undercurl = true, sp = t.yellow },
        DiagnosticUnderlineInfo    = { undercurl = true, sp = t.purple },
        DiagnosticUnderlineHint    = { undercurl = true, sp = t.cyan },

        -- ── Oil ─────────────────────────────────────────────────────────────
        OilHidden      = { fg = util.blend(t.bg_solid, t.grey, 0.55) },
    }

    return highlights
end

return M
