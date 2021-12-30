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

" Double ESC to exit from terminal insert mode to terminal normal mode
tnoremap <Esc><Esc> <C-\><C-n>

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
