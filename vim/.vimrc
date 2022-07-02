set encoding=utf-8
syntax on
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
set splitright
set splitbelow
set tabstop=3
set timeoutlen=1000
set ttimeoutlen=0
set foldmethod=marker
set updatetime=300
set wrap
set smartcase
set noerrorbells visualbell t_vb=
set nobackup
set noswapfile
set ignorecase
set nowritebackup
set backspace=indent,eol,start
set clipboard+=unnamedplus
set fillchars=vert:\┊ | set foldtext=CustomFold()
set noshowmode
set wildmenu
set hidden
set cmdheight=2
set termencoding=utf-8
set background=dark
set termguicolors

if has("gui_running")
		:set guioptions-=m  "remove menu bar
		:set guioptions-=T  "remove toolbar
		:set guioptions-=r  "remove right-hand scroll bar
		:set guioptions-=L  "remove left-hand scroll bar
		set guifont=FiraCode\Nerd\Font\ 10
		set novb
		set guicursor=a:blinkon0
		map <S-Insert> <MiddleMouse>
		map! <S-Insert> <MiddleMouse>
	endif

let mapleader = ","

if &t_Co > 2

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

 " When editing a file, always jump to the last cursor position
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif

let g:prettier#exec_cmd_path = "~/.local/npm/bin/prettier"
let python_highlight_all=1
let g:flake8_show_in_file=1
let g:pymode_indent = 0
