-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
-- choose fish as default shell, with startup fish prompt
config.default_prog = { '/opt/homebrew/bin/fish', '--login' }
-- choose font with ligatures
config.font = wezterm.font 'JetBrains Mono'
-- remove black bar from bottom of screen
config.window_padding = {
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config

