local opt = vim.opt
local g = vim.g
local present_config, config = pcall(require, "core.utils")

if not present_config then
    error "No utils module was found."
end

config = config.load_config()

opt.viewoptions:remove "curdir"             -- disable saving current directory with views
opt.shortmess:append { s = true, I = true } -- disable startup message
opt.backspace:append { "nostop" }           -- Don't stop backspace at insert

opt.isfname:append("@-@")
opt.iskeyword:append "-"                    -- hyphenated words recognized by searches
opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.

if vim.fn.has "nvim-0.9" == 1 then
    vim.opt.diffopt:append "linematch:60" -- enable linematch diff algorithm
end

local options = {}

options.opt = {
    hlsearch = false,
    laststatus = 3,
    showmode = false,
    showcmd = false,
    clipboard = "unnamedplus",
    cursorline = true,
    autoindent = true,
    expandtab = true,
    shiftwidth = 4,
    smartindent = true,
    tabstop = 4,
    softtabstop = 4,
    breakindent = true,
    copyindent = true,
    preserveindent = true,
    fillchars = { eob = " " },
    ignorecase = true,
    smartcase = true,
    mouse = "",
    linebreak = true,
    number = true,
    numberwidth = 4,
    ruler = false,
    sidescrolloff = 8,
    signcolumn = "yes",
    splitbelow = true,
    splitkeep = vim.fn.has "nvim-0.9" == 1 and "screen" or nil, -- Maintain code view when splitting
    splitright = true,
    termguicolors = true,
    timeoutlen = 500,
    completeopt = { "menuone", "noselect" },
    cmdheight = 2,
    pumheight = 10,
    scrolloff = 8,
    foldenable = true,
    foldlevel = 99,
    foldlevelstart = 99,
    foldcolumn = vim.fn.has "nvim-0.9" == 1 and "1" or nil,
    fileencoding = "utf-8",
    wrap = false,
    backup = false,
    writebackup = false,
    swapfile = false,
    updatetime = 300,
    hidden = true,
    wildmenu = true,
    nrformats = "unsigned",
    incsearch = true,
    fixeol = true,
    virtualedit = "block",
    colorcolumn = "80",
}

options.g = {
    nvim_theme = config.ui.theme,
    toggle_theme_icon = "   ",
    transparency = config.ui.transparency,
    mapleader = ",",
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
    termencoding = "utf-8",
    python3_host_prog = "/home/prxvvy/.local/python/bin/python",
    prettier_exec_cmd_path = "/home/prxvvy/.local/npm/bin/prettier",
}

for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        vim[scope][setting] = value
    end
end

local autocmd = vim.api.nvim_create_autocmd

-- disable some default providers
for _, provider in ipairs { "perl", "ruby" } do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end


require("base46").load_all_highlights()

vim.opt.statusline = "%!v:lua.require('ui.statusline." .. config.ui.statusline.theme .. "').run()"

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- dont list quickfix buffers
autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

autocmd("BufWritePost", {
    pattern = "*.lua",
    callback = function(opts)
        local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
        local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
        local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

        require("plenary.reload").reload_module "base46"
        require("plenary.reload").reload_module(module)

        config = require("core.utils").load_config()

        g.nvim_theme = config.ui.theme
        g.transparency = config.ui.transparency

        require("base46").load_all_highlights()
        vim.opt.statusline = "%!v:lua.require('ui.statusline." .. config.ui.statusline.theme .. "').run()"
        -- vim.cmd("redraw!")
    end,
})

vim.api.nvim_create_autocmd(
    "BufWritePre", {
        pattern = { " *.js", "*.jsx", "*.mjs", "*.ts", "*.tsx", "*.css", "*.less", "*.scss", "*.json", "*.graphql",
            "*.md", "*.vue", "*.svelte", "*.yaml", "*.html" },
        callback = function()
            vim.api.nvim_exec([[PrettierAsyn]], true)
        end,
    })

vim.api.nvim_create_autocmd(
    "BufWritePre", {
        pattern = { "*.py", "*.pyi" },
        callback = function()
            vim.api.nvim_exec([[Black]], true)
        end,
    })
