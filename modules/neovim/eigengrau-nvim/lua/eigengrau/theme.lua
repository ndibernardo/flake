local colors = require("eigengrau.colors")
local util = require("eigengrau.util")

local M = {}

function M.setup()
    local config = require("eigengrau.config")
    local opts = config.options

    local theme = {}
    ---@type eigengrau.Palette
    local t = vim.tbl_deep_extend("force", {}, colors.default)

    -- Apply user color overrides
    t = vim.tbl_deep_extend("force", t, opts.colors or {})

    -- bg_solid: the opaque bg used for blending (before transparency is applied)
    t.bg_solid = t.bg ~= "NONE" and t.bg or t.bg_alt

    if opts.transparent then
        t.bg = "NONE"
    end

    if opts.hide_fillchars then
        vim.opt.fillchars:append({
            horiz     = " ",
            horizup   = " ",
            horizdown = " ",
            vert      = " ",
            vertleft  = " ",
            vertright = " ",
            verthoriz = " ",
            eob       = " ",
        })
    end

    if opts.terminal_colors then
        -- 0/8  black  → bg tones
        vim.g.terminal_color_0  = t.bg
        vim.g.terminal_color_8  = t.bg_highlight
        -- 1/9  red
        vim.g.terminal_color_1  = t.red
        vim.g.terminal_color_9  = t.red
        -- 2/10 green
        vim.g.terminal_color_2  = t.orange   -- orange slot = #86DA87 (eigengrau green)
        vim.g.terminal_color_10 = t.orange
        -- 3/11 yellow
        vim.g.terminal_color_3  = t.yellow
        vim.g.terminal_color_11 = t.yellow
        -- 4/12 blue
        vim.g.terminal_color_4  = t.purple   -- purple slot = #aaccff (eigengrau type-blue)
        vim.g.terminal_color_12 = t.purple
        -- 5/13 magenta
        vim.g.terminal_color_5  = t.magenta
        vim.g.terminal_color_13 = t.magenta
        -- 6/14 cyan
        vim.g.terminal_color_6  = t.cyan
        vim.g.terminal_color_14 = t.cyan
        -- 7/15 white
        vim.g.terminal_color_7  = t.fg
        vim.g.terminal_color_15 = "#e8e8e8"
    end

    -- Build highlights
    theme.highlights = require("eigengrau.extensions.base").get(opts, t)
    theme.highlights = vim.tbl_deep_extend(
        "force",
        theme.highlights,
        require("eigengrau.extensions.treesitter").get(opts, t)
    )

    -- User overrides
    local overrides = opts.overrides
    if type(overrides) == "function" then
        overrides = overrides(t)
    end
    theme.highlights = vim.tbl_extend("force", theme.highlights, overrides or {})

    return theme
end

return M
