let python_highlight_all=1
let g:flake8_show_in_file=1
let g:pymode_indent = 0
 " When editing a file, always jump to the last cursor position
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif
