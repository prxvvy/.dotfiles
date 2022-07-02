command! Q q " Quit while still pressing Shift
command! Qa qa " Quit all while still pressing Shift
command! W w " Write while still pressing Shift
command! Wq wq " Write-quit while still pressing Shift
command! Wqa wqa " Write-quit all while still pressing Shift

nmap <silent> <Esc> :nohlsearch<CR>
cmap w!! w !sudo tee > /dev/null %

" Alternate way to save
nnoremap <C-s> :w<CR>

" Quit buffer or quit vim
nmap <C-q> :q <CR>

" Source current file
nmap <leader>so :so%<CR>

" Move to the next buffer
nnoremap <silent> <TAB> :bnext<CR>

" Move back to the previous buffer
nnoremap <silent> <S-TAB> :bprevious<CR>

" Close current buffer
nnoremap <silent> <C-b> :bd<CR>

noremap <silent> <A-l> :vertical resize +5<CR>
nnoremap <silent> <A-h> :vertical resize -5<CR>
nnoremap <silent> <A-j> :resize +5<CR>
nnoremap <silent> <A-k> :resize -5<CR>

nnoremap <silent> <leader>e :e $MYVIMRC<CR>

noremap <silent><F2> :CocCommand explorer --toggle<CR>
nnoremap <silent><leader>b :Black<CR>
nnoremap <silent><leader>p :Prettier<CR>
nnoremap <silent><F4> :ClangFormat<CR>
noremap <silent><F3> :TemplateInit<CR>

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
" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Enter command mode
noremap ; :

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Basic file system commands
nnoremap <A-o> :!touch<Space>
nnoremap <A-e> :!crf<Space>
nnoremap <A-d> :!mkdir<Space>
nnoremap <A-m> :!mv<Space>%<Space>

" Keeping it centered

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Behave Vim

nnoremap Y y$

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Double ESC to exit from terminal insert mode to terminal normal mode
tnoremap <Esc><Esc> <C-\><C-n>

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

autocmd InsertEnter * norm zz
autocmd BufWritePre * %s/\s\+$//e
