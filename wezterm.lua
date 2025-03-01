-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Detect architecture and set the correct fish shell path
local shell_path = '/usr/local/bin/fish' -- Default for Intel Macs
if wezterm.target_triple:find('aarch64') then
  shell_path = '/opt/homebrew/bin/fish' -- Use Homebrew path for Apple Silicon
end

-- Choose fish as the default shell, with startup fish prompt
config.default_prog = { shell_path, '--login' }

-- Choose font with ligatures
config.font = wezterm.font 'JetBrains Mono'

-- Remove black bar from bottom of screen
config.window_padding = {
  bottom = 0,
}

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- And finally, return the configuration to WezTerm
return config
