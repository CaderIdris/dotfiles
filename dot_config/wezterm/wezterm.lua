local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Gruvbox dark, hard (base16)'
config.warn_about_missing_glyphs = false

config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0
}

return config
