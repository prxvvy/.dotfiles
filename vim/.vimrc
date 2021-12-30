function! CustomFold()
	return printf('    %-6d%s', v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction
if &compatible | set nocompatible | endif
set encoding=utf-8
set autoindent
set colorcolumn=81
set completeopt=menuone,noinsert,noselect,preview
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
set clipboard=unnamedplus
set fillchars=fold:\ | set foldtext=CustomFold()
set noshowmode

let mapleader = ","
