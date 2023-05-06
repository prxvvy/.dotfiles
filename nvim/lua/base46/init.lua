local M = {}
local g = vim.g

local config = require("core.utils").load_config()
local base46_path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")

M.get_theme_tb = function(type)
    local path = "base46.themes." .. g.nvim_theme

    local present_path, theme = pcall(require, path)

    if not present_path then
        error("No such theme " .. g.nvim_theme)
    end

    return theme[type]
end


M.merge_tb = function(table1, table2)
    return vim.tbl_deep_extend("force", table1, table2)
end

M.extend_default_hl = function(highlights)
    local polish_hl = M.get_theme_tb "polish_hl"

    -- polish themes
    if polish_hl then
        for key, value in pairs(polish_hl) do
            if highlights[key] then
                highlights[key] = M.merge_tb(highlights[key], value)
            end
        end
    end

    -- transparency
    if vim.g.transparency then
        local glassy = require "base46.glassy"

        for key, value in pairs(glassy) do
            if highlights[key] then
                highlights[key] = M.merge_tb(highlights[key], value)
            end
        end
    end
end

M.load_highlight = function(group)
    group = require("base46.integrations." .. group)
    M.extend_default_hl(group)

    return group
end


M.load_all_highlights = function()
    local hl_files = base46_path .. "/integrations"

    for _, file in ipairs(vim.fn.readdir(hl_files)) do
        if file ~= "statusline" or file ~= "treesitter" then
            local filename = vim.fn.fnamemodify(file, ":r")

            local hl = vim.api.nvim_set_hl
            local hls = M.load_highlight(filename)

            for group_, value in pairs(hls) do
                hl(0, group_, value)
            end
        end
    end
end

return M
