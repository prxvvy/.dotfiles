local M = {}
local fn = vim.fn

M.list_themes = function()
    local base46_path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")

    -- local default_themes = vim.fn.readdir(vim.fn.stdpath "data" .. "/lazy/base46/lua/base46/themes")

    local default_themes = vim.fn.readdir(base46_path .. "/themes")

    for index, theme in ipairs(default_themes) do
        default_themes[index] = fn.fnamemodify(fn.fnamemodify(theme, ":t"), ":r")
    end

    return default_themes
end

M.replace_word = function(old, new)
    local chadrc = vim.fn.stdpath "config" .. "/lua/custom/" .. "chadrc.lua"
    local file = io.open(chadrc, "r")
    local added_pattern = string.gsub(old, "-", "%%-") -- add % before - if exists
    local new_content = file:read("*all"):gsub(added_pattern, new)

    file = io.open(chadrc, "w")
    file:write(new_content)
    file:close()
end

return M
