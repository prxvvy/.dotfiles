let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
let g:tsuquyomi_disable_default_mappings = 1
autocmd FileType typescript noremap <silent> <C-]> :TsuDefinition<CR>
autocmd FileType typescriptreact noremap <silent> <C-]> :TsuDefinition<CR>
