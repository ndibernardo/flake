---@class eigengrau.Palette
---@field bg? string
---@field bg_alt? string
---@field bg_highlight? string
---@field bg_solid? string
---@field fg? string
---@field grey? string
---@field blue? string
---@field green? string
---@field cyan? string
---@field red? string
---@field yellow? string
---@field magenta? string
---@field pink? string
---@field orange? string
---@field purple? string

---@class eigengrau.Colors
---@field default eigengrau.Palette
local M = {}

-- Palette derived from Jack Rusher's doom-eigengrau and the Noctilux color scheme.
-- Slot → semantic role (eigengrau):
--   blue    → functions / teal (#4db5bd)
--   green   → strings / steel-blue (#86AEDA)
--   cyan    → namespaces / imports (#56d4de)
--   red     → errors / numbers / macros (#ff463b)
--   yellow  → comments (#DADA86)
--   orange  → keywords / operators (#86DA87, green in eigengrau)
--   purple  → types / classes (#aaccff, eigengrau "type blue")
--   magenta → statements / builtins (#DB85D9)
--   pink    → constants / violet (#B286DB)
--   grey    → punctuation / ui chrome (#7A8490)
M.default = {
    bg           = "#16161d",
    bg_alt       = "#1c1c24",
    bg_highlight = "#22222c",
    fg           = "#b2b2bb",
    grey         = "#7A8490",
    blue         = "#4db5bd",   -- functions (teal)
    green        = "#86AEDA",   -- strings (steel blue)
    cyan         = "#56d4de",   -- namespaces, boolean
    red          = "#ff463b",   -- errors, numbers, macros
    yellow       = "#DADA86",   -- comments (warm yellow)
    magenta      = "#DB85D9",   -- statements, builtins
    pink         = "#B286DB",   -- constants (violet)
    orange       = "#86DA87",   -- keywords, operators (green)
    purple       = "#aaccff",   -- types, classes (light blue)
}

return M
