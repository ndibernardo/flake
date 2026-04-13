local theme = require("eigengrau.theme")
local config = require("eigengrau.config")
local util = require("eigengrau.util")

local M = {}

function M.load()
    util.load(theme.setup())
end

M.setup = config.setup
M.colorscheme = M.load

vim.api.nvim_create_user_command("EigengrauToggleTransparent", function()
    local opts = vim.g.eigengrau_opts or {}
    opts.transparent = not opts.transparent
    config.setup(opts)
    vim.cmd("colorscheme eigengrau")
end, {})

return M
