local opt = vim.opt
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g

opt.isfname:append("@-@")

local opts = {
	mouse = "",
	backup = false,
    cursorline = true,
	fileencoding = "utf-8",
	autoindent = true,
	colorcolumn = "80",
	completeopt = { "menuone", "noinsert", "noselect" },
	fixeol = true,
	hlsearch = false,
	incsearch = true,
    linebreak = true,
	expandtab = true,
	number = true,
	nrformats = "unsigned",
	sidescrolloff = 8,
	scrolloff = 8,
	shiftwidth = 4,
	shortmess = "c",
	showcmd = true,
	signcolumn = "yes",
	smartindent = true,
	smarttab = true,
	softtabstop = 0,
	splitbelow = true,
	splitright = true,
	tabstop = 4,
	timeoutlen = 500,
	ttimeoutlen = 0,
	foldmethod = "marker",
	updatetime = 50,
	wrap = false,
	smartcase = true,
	swapfile = false,
	ignorecase = true,
	writebackup = false,
	backspace = "indent,eol,start",
	clipboard = "unnamedplus",
	showmode = false,
	wildmenu = true,
	hidden = true,
	cmdheight = 2,
	pumheight = 10,
	conceallevel = 0,
    termguicolors=true,
	background = "dark",
	fillchars = {
		vert = "┊",
		fold = "⠀",
		eob = " ", -- suppress ~ at EndOfBuffer--diff
		diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
		msgsep = "‾",
		foldopen = "▾",
		foldsep = "│",
		foldclose = "▸",
	}
}

for key, value in pairs(opts) do
	opt[key] = value
end

cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"
exec([[
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif
]], true)

g.mapleader = ","

g.termencoding = "utf-8"
g.python3_host_prog = "/home/prxvvy/.local/python/bin/python"
g.prettier_exec_cmd_path = "/home/prxvvy/.local/npm/bin/prettier"

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

exec([[
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
]], true)

g.tmpl_author_email = "qsk55464@gmail.com"
g.tmpl_search_paths = {"~/.dotfiles/nvim/templates"}
g.tmpl_author_name = "prxvvy"
g.tmpl_auto_initialize = 0
