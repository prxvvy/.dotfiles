local M = {}

M.options = {}

M.ui = {
    hl_add = {},
    hl_override = {},
    changed_themes = {},
    theme_toggle = { "onedark" },
    theme = "chadracula", -- default theme
    transparency = false,
    -- cmp themeing
    cmp = {
        icons = true,
        lspkind_text = true,
        style = "default",            -- default/flat_light/flat_dark/atom/atom_colored
        border_color = "grey_fg",     -- only applicable for "default" style, use color names from base30 variables
        selected_item_bg = "colored", -- colored / simple
    },
    telescope = {
        style = "borderless", -- borderless / bordered
    },
    statusline = {
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "default",
        overriden_modules = nil,
    },
    lsp = {
        -- show function signatures i.e args as you type
        signature = {
            disabled = false,
            silent = true, -- silences 'no signature help available' message from appearing
        },
    },
}

M.lazy_nvim = {} -- config for lazy.nvim startup options

M.mappings = {}

return M
