local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Gruvbox dark, hard (base16)'

config.warn_about_missing_glyphs = false

config.font = wezterm.font 'ComicShannsMono Nerd Font'

config.initial_cols = 200
config.initial_rows = 50


config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0
}

config.default_prog = { '/usr/bin/tmux'}

config.window_decorations = 'RESIZE'

config.window_background_opacity = 1

wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

config.keys = {
    {
      key = 'B',
      mods = 'CTRL|ALT',
      action = wezterm.action.EmitEvent 'toggle-opacity',
    },
}



















return config
