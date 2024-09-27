local wezterm = require("wezterm")

local M = {}

function M.setup(config)
	config.font = wezterm.font_with_fallback({
		"Mononoki Nerd Font Mono",
		"JetBrainsMono Nerd Font",
		"BlexMono Nerd Font",
	})
	config.font_size = 14.0
	config.bold_brightens_ansi_colors = true
	config.cell_width = 1.1
	config.line_height = 1.5
	config.underline_thickness = "200%"
	config.underline_position = "-3pt"
	config.adjust_window_size_when_changing_font_size = false
	config.window_frame = {
		font = wezterm.font({ family = "Noto Sans", weight = "Regular" }),
		font_size = 13.0,
	}
end

return M
