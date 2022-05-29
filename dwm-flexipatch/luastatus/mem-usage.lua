package.path = package.path .. ";/home/prxvvy/.dotfiles/dwm/luastatus/colorscheme/?.lua"
local color = require("color")

widget = luastatus.require_plugin('mem-usage-linux').widget {
	timer_opts = { period = 2 },
	cb = function(t)
		local used_kb = t.total.value - t.avail.value
		return {
			string.format(color.sep .. color.mem_usage_ic_fg .. color.mem_usage_ic_bg .. ' MEM ' .. color.mem_usage_fg .. color.mem_usage_bg .. ' %3.2f GiB ', used_kb / 1024 / 1024)
		}
	end,
}
