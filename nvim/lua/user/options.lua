local set = vim.opt
local g = vim.g
--local fn = vim.fn
local exec = vim.api.nvim_exec
local keymap = vim.api.nvim_set_keymap
local cmd = vim.cmd
local autocmd = vim.api.nvim_command
local vimBuff = vim.api.nvim_buf_set_keymap
local tbl = vim.tbl_extend

local opts = {
	mouse = '',
	backup = false,
	fileencoding = 'utf-8',
	autoindent = true,
	colorcolumn = '81',
	completeopt = { 'menuone', 'noinsert', 'noselect' },
	fixeol = true,
	hlsearch = true,
	incsearch = true,
	linebreak = true,
	expandtab = false,
	number = true,
	nrformats = 'unsigned',
	sidescrolloff = 8,
	scrolloff = 8,
	shiftwidth = 0,
	shortmess = 'c',
	showcmd = true,
	signcolumn = 'number',
	smartindent = true,
	smarttab = true,
	softtabstop = 0,
	splitbelow = true,
	splitright = true,
	tabstop = 3,
	timeoutlen = 500,
	ttimeoutlen = 0,
	foldmethod = 'marker',
	updatetime = 300,
	wrap = true,
	smartcase = true,
	swapfile = false,
	ignorecase = true,
	writebackup = false,
	backspace = 'indent,eol,start',
	clipboard = 'unnamedplus',
	-- fillchars = 'vert:\┊ | set foldtext=CustomFold()',
	showmode = false,
	wildmenu = true,
	hidden = true,
	cmdheight = 2,
	termguicolors = true,
	pumheight = 10,
	conceallevel = 0,
	background = 'dark',
	fillchars = {
		vert = "┊",
		fold = "⠀",
		eob = " ", -- suppress ~ at EndOfBuffer--diff
		--diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
		msgsep = "‾",
		foldopen = "▾",
		foldsep = "│",
		foldclose = "▸",
	}
}

for key, value in pairs(opts) do
	set[key] = value
end
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

g.termencoding = 'utf-8'
g.python3_host_prog = '/home/prxvvy/.local/python/bin/python'
exec([[
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif
]], true)
g.prettier_exec_cmd_path = '/home/prxvvy/.local/npm/bin/prettier'

g.mapleader = ","

return {
	glob = g,
	cmd = cmd,
	keymap = keymap,
	buffKeymap = vimBuff,
	tbl = tbl,
}
