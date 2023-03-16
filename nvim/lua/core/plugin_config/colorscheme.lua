local colorscheme = "gruvbox"
local colorscheme_plugin_name = "gruvbox"

local status_ok, colorscheme_plugin = pcall(require, colorscheme_plugin_name)
if not status_ok then
  return
end

colorscheme_plugin.setup({
    contrast = "hard",
    invert_selection = true
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
