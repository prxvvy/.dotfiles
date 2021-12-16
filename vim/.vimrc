" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
endif
let python_highlight_all=1
syntax enable
set showtabline=2
set nocompatible
syntax on
filetype on
filetype plugin indent on
set modeline
set foldmethod=marker
set exrc
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000
set cursorline
set softtabstop=4
set formatoptions-=cro
set termencoding=utf-8
set relativenumber
set background=dark
set encoding=utf-8
set guicursor=
set incsearch
set isfname+=@-@
set autochdir
set cot+=preview
set number
set noswapfile
set backspace=indent,eol,start
set clipboard=unnamedplus
set completeopt=menuone,noinsert,noselect,preview
set complete-=i
set shortmess+=c
set noshowmode
set showmatch
set hidden
set nobackup
set noswapfile
set nowritebackup
set expandtab
set tabstop=4
set shiftwidth=4
set nolazyredraw
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildmenu
set wildmode=list:longest,full
set fillchars+=vert:\┊
set splitright                                          " open vertical split to the right
set splitbelow
set background=dark
set autoindent
set copyindent
set shiftround
set smarttab
set laststatus=2
set signcolumn = number
set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
set errorformat=%f:%l:\ %m
set wrap breakindent
set cmdheight=1
set smartcase
set scrolloff=8
set noerrorbells
set undolevels=1000
set title
set updatetime=50
set pastetoggle=<F2>
set hlsearch
set guifont=hack_nerd_font:h21

let mapleader = ","

" Behave Vim

nnoremap Y y$

" Keeping it centered

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Moving text

vnoremap J :m '>+1<CR>gv==gv
vnoremap K :m '<-2<CR>gv==gv
inoremap <C-j> :m .+1 <CR>==
inoremap <C-k> :m .-2 <CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+2<CR>==

" Remap escape
nnoremap <C-c> <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>
nnoremap <silent> <leader>e :e $MYVIMRC<CR>

" Create a new buffer
nnoremap <silent> <leader>t :tabe<CR>

" General mapping

" Open Nerdtree
noremap <silent> <F2> :NERDTreeToggle<CR>

" Open undotree
noremap <silent> <F3> :UndotreeToggleCR>

" Save file
nmap <leader>w :w <CR>

" Alternate way to quit and save
nnoremap <C-q> :wq!<CR>

" Quit buffer or quit vim
nmap <C-w> :q <CR>

" Source current file
nmap <leader>so :so%<CR>

" Move to the next buffer
nnoremap <silent> <TAB> :bnext<CR>

" Move back to the previous buffer
nnoremap <silent> <S-TAB> :bprevious<CR>

" Close current buffer
nnoremap <C-b> :bd<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" open terminal
vnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
nmap <silent> ,/ :nohlsearch<CR>
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino { {}<left>
ino [ []<left>
ino < <><left>

packadd! gruvbox-material
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
" Mark trailing spaces depending on whether we have a fancy terminal or not
if &t_Co > 2
	highlight ExtraWhitespace ctermbg=1
	match ExtraWhitespace /\s\+$/
else
	set listchars=trail:~
	set list
endif
aug FixTypos
    :command! WQ wq
    :command! Wq wq
    :command! QA qa
    :command! Qa qa
    :command! W w
    :command! Q q
aug end
au InsertLeave * set nopaste " Exit paste mode when leaving insert mode
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
hi Pmenu guibg='#00010a' guifg=white                    " popup menu colors
hi Comment gui=italic cterm=italic                      " italic comments
hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words
au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
highlight Folded cterm=reverse ctermbg=0 ctermfg=8
	highlight VertSplit cterm=NONE ctermbg=NONE ctermfg=8
	highlight Conceal cterm=NONE ctermbg=NONE ctermfg=8

	highlight DiffAdd ctermfg=green cterm=bold
	highlight DiffDelete ctermfg=red cterm=bold
	highlight DiffChange ctermfg=yellow

	set colorcolumn=111
au BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufWritePre *.py execute ':Black'
let g:black_linelength = 79
let &t_SI ="\e[6 q"
let &t_EI ="\e[2 q"
