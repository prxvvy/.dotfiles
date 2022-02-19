let python_highlight_all=1
let g:flake8_show_in_file=1
let g:pymode_indent = 0
 " When editing a file, always jump to the last cursor position
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif

 let g:prettier#exec_cmd_path = "~/.local/npm/bin/prettier"
let g:airline_powerline_fonts = 1
