local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

config.keys = {
	{
		key = 'LeftArrow',
		mods = 'CMD',
		action = act.SendKey { key = 'Home' },
	},
	{
		key = 'RightArrow',
		mods = 'CMD',
		action = act.SendKey { key = 'End' },
	},
	-- Move backward a word
	{
		key = 'LeftArrow',
		mods = 'OPT',
		action = act.SendString '\x1bb',
	},
	-- Move forward a word
	{
		key = 'RightArrow',
		mods = 'OPT',
		action = act.SendString '\x1bf',
	},
	-- Delete the line
	{
		key = 'phys:Backspace',
		mods = 'CMD',
		action = act.SendKey { key = 'u', mods = 'CTRL' }
	},
}

return config
