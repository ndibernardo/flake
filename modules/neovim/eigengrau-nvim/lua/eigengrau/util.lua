local M = {}

--- @alias RGB table {number, number, number}

--- Set syntax highlighting for a group.
--- @param syntax table
function M.syntax(syntax)
    for group, colors in pairs(syntax) do
        vim.api.nvim_set_hl(0, group, colors)
    end
end

--- Convert hex to RGB.
--- @param hex string "#rrggbb"
--- @return RGB
function M.hex_to_rgb(hex)
    return {
        tonumber(hex:sub(2, 3), 16),
        tonumber(hex:sub(4, 5), 16),
        tonumber(hex:sub(6, 7), 16),
    }
end

--- Convert RGB to hex.
--- @param rgb RGB
--- @return string
function M.rgb_to_hex(rgb)
    return string.format("#%02x%02x%02x", rgb[1], rgb[2], rgb[3])
end

--- Blend two hex colors together. weight=1 returns color1, weight=0 returns color2.
--- @param color1 string
--- @param color2 string
--- @param weight? number
--- @return string
function M.blend(color1, color2, weight)
    weight = weight or 0.5
    local rgb1 = M.hex_to_rgb(color1)
    local rgb2 = M.hex_to_rgb(color2)
    local blended = {}
    for i = 1, 3 do
        blended[i] = math.floor(rgb1[i] * weight + rgb2[i] * (1 - weight))
    end
    return string.format("#%02x%02x%02x", blended[1], blended[2], blended[3])
end

--- Load the colorscheme.
--- @param theme table
function M.load(theme)
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = "eigengrau"
    M.syntax(theme.highlights)
end

return M
