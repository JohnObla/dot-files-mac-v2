-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.leader = { key = 'p', mods = 'CTRL' }
config.keys = {
  {
    key = 'e',
    mods = 'LEADER|CTRL',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false
    },
  },
  {
    key = 'w',
    mods = 'LEADER|CTRL',
    action = act.ActivateKeyTable {
      name = 'mutate_pane'
    },
  },
  {
    key = 'q',
    mods = 'LEADER',
    action = act.CloseCurrentPane { confirm = true }
  }
}
config.key_tables = {
  resize_pane = {
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },
    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },
  },
  mutate_pane = {
    { key = 'v', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 's', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },

    { key = 'h', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', action = act.ActivatePaneDirection 'Right' },
    { key = 'k', action = act.ActivatePaneDirection 'Up' },
    { key = 'j', action = act.ActivatePaneDirection 'Down' },

    { key = 'Escape', action = 'PopKeyTable' },
  },
}

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.default_prog = { '/opt/homebrew/bin/fish', '--login' }
config.font = wezterm.font 'JetBrains Mono'



-- and finally, return the configuration to wezterm
return config

