-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- my coolnight colorscheme:
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- and finally, return the configuration to wezterm

-- # config.default_prog = { "/opt/pkg/bin/tmux" }

config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseconds = 2000,
}

config.keys = {
  {
    key = '[',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
  },
}

config.keys = {
  {
    key = 'f',
    mods = 'ALT',
    action = wezterm.action.TogglePaneZoomState,
  },
}

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

config.keys = {
	-- Move between windows
	{
		key = "f",
		mods = "CTRL|CMD",
		action = wezterm.action.ToggleFullScreen,
	},
}


config.colors = {
  background = "#000000",
  foreground = "#ffa028",
  cursor_bg = "#ffa028",
  cursor_border = "#ffa028",
  cursor_fg = "#000000",
  selection_bg = "#ffa028",
  selection_fg = "#000000",

  ansi = {"#000000","#FF3428","#f6fe11","#c2a86c","#7a4f17","#7a4f17","#ffa028","#ffa028"},
  brights = {"#666666","#feba11","#777777","#feba11","#feba11","#feba11","#ffa028","#ffa028"}
}

-- Font
config.font = wezterm.font("Mononoki Nerd Font Mono")
config.font_size = 13
config.bold_brightens_ansi_colors = true
config.cell_width = 1.1
config.line_height = 1.5

-- Terminal features
config.enable_tab_bar = true
config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 1

config.window_close_confirmation = 'NeverPrompt'

-- Key bindings
local act = wezterm.action

config.keys = {
  {
    key = 'k',
    mods = 'CMD',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackOnly',
      act.SendKey { key = 'L', mods = 'CTRL' },
    }    
  }
}

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800

local keys = require("keys")
local fonts = require("fonts")

-- local tabline = require("plugins.tabline")
-- local smartsplits = require("plugins.smart-splits")
-- local workspaceswitcher = require("plugins.workspace-switcher")

keys.setup(config)
fonts.setup(config)
-- tabline.setup()
-- smartsplits.setup(config)
-- workspaceswitcher.setup(config)

return config

