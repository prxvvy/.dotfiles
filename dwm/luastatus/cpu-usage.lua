package.path = package.path .. ";/home/prxvvy/.dotfiles/dwm/luastatus/colorscheme/?.lua"
local color = require("color")

widget = luastatus.require_plugin('cpu-usage-linux').widget {
	cb = function(usage)
		return {
			string.format(color.sep .. color.cpu_usage_ic_fg .. color.cpu_usage_ic_bg .. '  ' .. color.cpu_usage_fg .. color.cpu_usage_bg .. ' %5.1f%% ', usage * 100)
		}
	end,
}
