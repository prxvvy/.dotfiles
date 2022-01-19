noremap <silent><F2> :NERDTreeToggle<CR>
" let NERDTreeQuitOnOpen=1
let g:NERDTreeIgnore=['\.rbc$','\.pyc$', '\.db$', '\.sqlite$', ' __pycache__/', 'node_modules', '\package-lock.json', '*.out', '*.o']
let NERDTreeWinSize=20
let NERDTreeCaseSensitiveSort=1
" let NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=2
let NERDTreeDirArrows=1
let NERDTreeMapOpenInTab='\t'
let NERDTreeAutoDeleteBuffer=1
autocmd VimEnter * NERDTree | wincmd p
autocmd VimEnter * NERDTree
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
