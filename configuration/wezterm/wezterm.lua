local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("Berkeley Mono", { weight = "Medium", stretch = "SemiCondensed" })
config.font_size = 12
config.initial_cols = 80
config.initial_rows = 24
config.window_padding = { left = 12, right = 12, top = 12, bottom = 12 }
config.use_resize_increments = false
config.hide_tab_bar_if_only_one_tab = true
if os.getenv("XDG_CURRENT_DESKTOP") == "niri" then
  config.window_decorations = "NONE"
else
  config.enable_wayland = false
end
config.audible_bell = "Disabled"

config.colors = {
  foreground = "#d8d8d8",
  background = "#111111",
  cursor_fg = "#111111",
  cursor_bg = "#d8d8d8",
  cursor_border = "#d8d8d8",
  selection_fg = "#d8d8d8",
  selection_bg = "#383838",
  ansi = {
    "#111111", "#ab4642", "#a1b56c", "#f7ca88",
    "#7cafc2", "#ba8baf", "#86c1b9", "#d8d8d8",
  },
  brights = {
    "#585858", "#ab4642", "#a1b56c", "#f7ca88",
    "#7cafc2", "#ba8baf", "#86c1b9", "#f8f8f8",
  },
  indexed = {
    [16] = "#dc9656",
    [17] = "#a16946",
    [18] = "#282828",
    [19] = "#383838",
    [20] = "#b8b8b8",
    [21] = "#e8e8e8",
  },
}

return config