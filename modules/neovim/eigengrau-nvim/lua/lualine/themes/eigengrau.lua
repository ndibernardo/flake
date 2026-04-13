---@type eigengrau.Palette
local colors = require("eigengrau.colors").default

local opts = (vim.g.eigengrau_opts or {})
if opts.transparent then
    colors.bg = "NONE"
end

-- mode accent colors:
--   normal  → type-blue  (purple slot, #aaccff)
--   insert  → green      (orange slot, #86DA87)
--   visual  → magenta    (#DB85D9)
--   replace → red        (#ff463b)
--   command → cyan       (#56d4de)
--   terminal→ teal/blue  (#4db5bd)
local eigengrau = {
    normal = {
        a = { fg = colors.bg,  bg = colors.purple,  gui = "bold" },
        b = { fg = colors.fg,  bg = colors.bg_alt },
        c = { fg = colors.fg,  bg = colors.bg },
        x = { fg = colors.grey, bg = colors.bg },
        y = { fg = colors.fg,  bg = colors.bg_alt },
        z = { fg = colors.bg,  bg = colors.grey },
    },
    insert = {
        a = { fg = colors.bg,  bg = colors.orange, gui = "bold" },
        z = { fg = colors.bg,  bg = colors.grey },
    },
    visual = {
        a = { fg = colors.bg,  bg = colors.magenta, gui = "bold" },
        z = { fg = colors.bg,  bg = colors.grey },
    },
    replace = {
        a = { fg = colors.bg,  bg = colors.red, gui = "bold" },
        z = { fg = colors.bg,  bg = colors.grey },
    },
    command = {
        a = { fg = colors.bg,  bg = colors.cyan, gui = "bold" },
        z = { fg = colors.bg,  bg = colors.grey },
    },
    terminal = {
        a = { fg = colors.bg,  bg = colors.blue, gui = "bold" },
        z = { fg = colors.bg,  bg = colors.grey },
    },
    inactive = {
        a = { fg = colors.grey, bg = colors.bg },
        b = { fg = colors.grey, bg = colors.bg },
        c = { fg = colors.grey, bg = colors.bg },
    },
}

return eigengrau
