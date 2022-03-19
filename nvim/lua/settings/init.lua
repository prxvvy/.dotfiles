local set = vim.opt
local g = vim.g
--local fn = vim.fn
local exec = vim.api.nvim_exec
local cmd = vim.cmd

set.fileencoding = 'utf-8'
set.autoindent = true
set.colorcolumn = '81'
set.completeopt = 'menuone,noinsert,noselect'
set.fixeol = true
set.hlsearch = true
set.incsearch = true
set.linebreak = true
set.expandtab = false
set.number = true
set.nrformats= 'unsigned'
set.scrolloff = 8
set.shiftwidth = 0
set.shortmess = 'c'
set.showcmd = true
set.signcolumn = 'number'
set.smartindent = true
set.smarttab = true
set.softtabstop= 0
set.splitbelow = true
set.splitright = true
set.tabstop= 3
set.timeoutlen= 1000
set.ttimeoutlen= 0
set.foldmethod='marker'
set.updatetime= 300
set.wrap = true
set.smartcase = true
set.backup = false
set.swapfile = false
set.ignorecase = true
set.writebackup = false
set.backspace='indent,eol,start'
set.clipboard = 'unnamedplus'
-- set.fillchars = 'vert:\┊ | set foldtext=CustomFold()'
set.showmode = false
set.wildmenu = true
set.hidden = true
set.cmdheight=2
set.termguicolors = true
set.background='dark'
g.termencoding = 'utf-8'

exec([[
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif
]], true)

g.prettier_exec_cmd_path = '~/.local/npm/bin/prettier'

return {
	glob = g
}
