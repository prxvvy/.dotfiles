command! Q q " Quit while still pressing Shift
command! Qa qa " Quit all while still pressing Shift
command! W w " Write while still pressing Shift
command! Wq wq " Write-quit while still pressing Shift
command! Wqa wqa " Write-quit all while still pressing Shift

noremap <silent><F3> :TemplateInit<CR>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

noremap <silent> <A-l> :vertical resize +5<CR>
nnoremap <silent> <A-h> :vertical resize -5<CR>
nnoremap <silent> <A-j> :resize +5<CR>
nnoremap <silent> <A-k> :resize -5<CR>

nnoremap <silent> <leader>e :e $MYVIMRC<CR>

nnoremap <silent><leader>b :Black<CR>
nnoremap <silent><leader>p :Prettier<CR>
nnoremap <silent><F4> :ClangFormat<CR>


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

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Enter command mode
noremap ; :

nmap <silent> <Esc> :nohlsearch<CR>
