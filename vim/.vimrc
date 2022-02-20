function! CustomFold()
	return printf('    %-6d%s', v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction
if &compatible | set nocompatible | endif

set encoding=utf-8
set autoindent
set colorcolumn=81
set completeopt=menuone,noinsert,noselect
set fixeol
set hlsearch
set incsearch
set linebreak
set noexpandtab
set number
set nrformats=unsigned
set scrolloff=8
set shiftwidth=0
set shortmess+=c
set showcmd
set signcolumn = number
set smartindent
set smarttab
set softtabstop=0
set splitbelow
set splitright
set tabstop=3
set timeoutlen=1000
set ttimeoutlen=0
set foldmethod=marker
set updatetime=300
set wrap
set nobackup
set noswapfile
set nowritebackup
set background=dark
set backspace=indent,eol,start
set clipboard+=unnamedplus
set fillchars=vert:\┊ | set foldtext=CustomFold()
set noshowmode
set wildmenu
set hidden
set cmdheight=2
set guifont=Monospace\ 10
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

let mapleader = ","

if &t_Co > 2
	syntax on
	color default
	set background=dark

	highlight Folded cterm=reverse ctermbg=0 ctermfg=8
	highlight VertSplit cterm=NONE ctermbg=NONE ctermfg=8
	highlight Conceal cterm=NONE ctermbg=NONE ctermfg=8

	highlight DiffAdd ctermfg=green cterm=bold
	highlight DiffDelete ctermfg=red cterm=bold
	highlight DiffChange ctermfg=yellow

	set colorcolumn=80

	" Syntax often gets messed up on files with multiple languages
	noremap <F12> <Esc>:syntax sync fromstart<CR>
	inoremap <F12> <C-o>:syntax sync fromstart<CR>
endif
