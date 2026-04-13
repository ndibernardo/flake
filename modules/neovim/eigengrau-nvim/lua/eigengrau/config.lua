local M = {}

---@class eigengrau.Highlight
---@field fg? string
---@field bg? string
---@field sp? string
---@field bold? boolean
---@field italic? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field strikethrough? boolean

---@alias eigengrau.OverrideFn fun(palette: eigengrau.Palette): table<string, eigengrau.Highlight>

---@class eigengrau.Config
---@field transparent? boolean
---@field italic_comments? boolean
---@field hide_fillchars? boolean
---@field terminal_colors? boolean
---@field colors? eigengrau.Palette
---@field overrides? table<string, eigengrau.Highlight> | eigengrau.OverrideFn
local default_options = {
    transparent      = false,
    italic_comments  = false,
    hide_fillchars   = false,
    terminal_colors  = true,
    colors           = {},
    overrides        = {},
}

---@type eigengrau.Config
M.options = {}

---@param options? eigengrau.Config
function M.setup(options)
    M.options = vim.tbl_deep_extend("force", {}, default_options, options or {})
    vim.g.eigengrau_opts = M.options
end

M.setup()

return M
