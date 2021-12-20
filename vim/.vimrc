
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
endif

let python_highlight_all=1
syntax enable
set nocompatible
syntax on
filetype on
filetype plugin indent on
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
set modelines=3
set modeline
set foldmethod=marker
set nojoinspaces
set diffopt=vertical
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
set st=2 sw=2 et
set expandtab
set tabstop=4
set shiftwidth=4
set nolazyredraw
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
let g:vim_json_syntax_conceal = 0
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
set timeoutlen=1000
set ttimeoutlen=0
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
set switchbuf=useopen
set smartcase
set scrolloff=8
set noerrorbells
set undolevels=1000
set title
set updatetime=50
set pastetoggle=<F2>
set hlsearch
set guifont=hack_nerd_font:h21
set textwidth=80
set shell=bash
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set timeoutlen=1500   " Give some time for multi-key mappings
" Don't set ttimeoutlen to zero otherwise it will break some Vim terminal
" behaviours
set ttimeoutlen=10
set secure

let g:flake8_show_in_file=1
let mapleader = ","

let g:pymode_indent = 0

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

let g:prettier#quickfix_enabled=0

" Black
nnoremap <silent><leader>b :Black<CR>
nnoremap <silent><leader>p :Prettier<CR>


" Create a new buffer
nnoremap <silent> <leader>t :tabe<CR>

" General mapping

" Open Nerdtree
noremap <silent> <F2> :NERDTreeToggle<CR>

" Open undotree
noremap <silent><F3> :UndotreeToggle<CR>

" Save file
nmap <leader>w :w <CR>

" Alternate way to quit and save
nnoremap <C-q> :wq!<CR>

" Quit buffer or quit vim
nmap <C-w> :q <CR>

" - Ctrl-a - go to the start of line
" - Ctrl-e - go to the end of the line
nnoremap <C-a> 0
nnoremap <C-e> $
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" - Alt-b  - back a word
" - Alt-f  - forward a word
" - Alt-BS - delete backward word
" - Alt-d  - delete forward word
inoremap <A-b>  <C-Left>
inoremap <A-f>  <C-Right>
inoremap <A-BS> <C-w>
inoremap <A-d>  <C-o>dw
cnoremap <A-b>  <C-Left>
cnoremap <A-f>  <C-Right>
cnoremap <A-BS> <C-w>
cnoremap <A-d>  <C-Right><C-w>

"-----------------------------
" Increment and decrement mappings
"-----------------------------
nnoremap + <C-a>
nnoremap - <C-x>
xnoremap + g<C-a>
xnoremap - g<C-x>

" Scroll mappings

nnoremap <C-Up>   <C-e>
nnoremap <C-Down> <C-y>

" Source current file
nmap <leader>so :so%<CR>

" Move to the next buffer
nnoremap <silent> <TAB> :bnext<CR>

" Move vertically by visual line unless preceded by a count. If a movement is
" greater than 5 then automatically add to the jumplist.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

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
noremap ; :

nmap <silent> ,/ :nohlsearch<CR>

nnoremap {  {zz
nnoremap }  }zz
nnoremap n  nzz
nnoremap N  Nzz
nnoremap [c [czz
nnoremap ]c ]czz
nnoremap [j <C-o>zz
nnoremap ]j <C-i>zz
nnoremap [s [szz
nnoremap ]s ]szz
nnoremap [z zH
nnoremap ]z zL

ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino { {}<left>
ino ` ``<left>
ino [ []<left>
ino < <><left>
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
hi Pmenu guibg='#00010a' guifg=white                    " popup menu colors
hi Comment gui=italic cterm=italic                      " italic comments
hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words
au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
au FileType help wincmd L                               " open help in vertical split
highlight Folded cterm=reverse ctermbg=0 ctermfg=8
	highlight VertSplit cterm=NONE ctermbg=NONE ctermfg=8
	highlight Conceal cterm=NONE ctermbg=NONE ctermfg=8

	highlight DiffAdd ctermfg=green cterm=bold
	highlight DiffDelete ctermfg=red cterm=bold
	highlight DiffChange ctermfg=yellow

	set colorcolumn=80
au BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
highlight BadWhitespace ctermbg=red guibg=darkred
let g:black_linelength = 79
let &t_SI ="\e[6 q"
let &t_EI ="\e[2 q"

function! CloseHiddenBuffers()
    " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    " close any buffers hidden
    " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    let open_buffers = []

    for i in range(tabpagenr('$'))
        call extend(open_buffers, tabpagebuflist(i + 1))
    endfor

    for num in range(1, bufnr("$") + 1)
        if buflisted(num) && index(open_buffers, num) == -1
            exec "bdelete ".num
        endif
    endfor
endfunction

au BufEnter * call CloseHiddenBuffers()
" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
