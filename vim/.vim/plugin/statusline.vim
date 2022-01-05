  " _____   __            __                     __     _
  " / ___/  / /_  ____ _  / /_  __  __   _____   / /    (_)   ____   ___
  " \__ \  / __/ / __ `/ / __/ / / / /  / ___/  / /    / /   / __ \ / _ \
 " ___/ / / /_  / /_/ / / /_  / /_/ /  (__  )  / /___ / /   / / / //  __/
" /____/  \__/  \__,_/  \__/  \__,_/  /____/  /_____//_/   /_/ /_/ \___/

set noshowmode
set laststatus=2

function! RedrawModeColors(mode) " {{{
    " Normal mode
    if a:mode == 'n'
        hi CustomStatuslineAccent     cterm=NONE gui=NONE ctermbg=NONE ctermfg=1   guibg=NONE    guifg=#fc8993
        hi CustomStatuslineAccentBody cterm=NONE gui=NONE ctermbg=1    ctermfg=0   guibg=#fc8993 guifg=#272c38
        hi CustomStatuslineFilename   cterm=NONE gui=NONE ctermbg=8    ctermfg=251 guibg=#272c38 guifg=#fc8993
        " Insert mode
    elseif a:mode == 'i'
        hi CustomStatuslineAccent     cterm=NONE gui=NONE ctermbg=NONE ctermfg=2   guibg=NONE    guifg=#8de19f
        hi CustomStatuslineAccentBody cterm=NONE gui=NONE ctermbg=2    ctermfg=0   guibg=#8de19f guifg=#272c38
        hi CustomStatuslineFilename   cterm=NONE gui=NONE ctermbg=8    ctermfg=251 guibg=#272c38 guifg=#8de19f
        " Replace mode
    elseif a:mode == 'R'
        hi CustomStatuslineAccent     cterm=NONE gui=NONE ctermbg=NONE ctermfg=1   guibg=NONE    guifg=#A65169
        hi CustomStatuslineAccentBody cterm=NONE gui=NONE ctermbg=1    ctermfg=0   guibg=#A65169 guifg=#272c38
        hi CustomStatuslineFilename   cterm=NONE gui=NONE ctermbg=8    ctermfg=251 guibg=#272c38 guifg=#A65169
        " Visual mode
    elseif a:mode == 'v' || a:mode == 'V' || a:mode == "\<C-V>"
        hi CustomStatuslineAccent     cterm=NONE gui=NONE ctermbg=NONE ctermfg=7   guibg=NONE    guifg=#a7bdfb
        hi CustomStatuslineAccentBody cterm=NONE gui=NONE ctermbg=7    ctermfg=0   guibg=#a7bdfb guifg=#272c38
        hi CustomStatuslineFilename   cterm=NONE gui=NONE ctermbg=8    ctermfg=7 guibg=#272c38 guifg=#a7bdfb
        " Command mode
    elseif a:mode == 'c'
        hi CustomStatuslineAccent     cterm=NONE gui=NONE ctermbg=NONE ctermfg=6   guibg=NONE    guifg=#ee828c
        hi CustomStatuslineAccentBody cterm=NONE gui=NONE ctermbg=6    ctermfg=0   guibg=#ee828c guifg=#272c38
        hi CustomStatuslineFilename   cterm=NONE gui=NONE ctermbg=8    ctermfg=6 guibg=#272c38 guifg=#ee828c
        " Terminal mode
    elseif a:mode == 't'
        hi CustomStatuslineAccent     cterm=NONE gui=NONE ctermbg=NONE ctermfg=3   guibg=NONE    guifg=#fbdf90
        hi CustomStatuslineAccentBody cterm=NONE gui=NONE ctermbg=3    ctermfg=0   guibg=#fbdb90 guifg=#272c38
        hi CustomStatuslineFilename   cterm=NONE gui=NONE ctermbg=8    ctermfg=3 guibg=#272c38 guifg=#fbdb90
    endif
    return ''
endfunction
" }}}
function! ModeIcon(mode) " {{{
    " Normal mode
    if a:mode == 'n'
        return '煮'
        " Insert mode
    elseif a:mode == 'i'
        return ' '
        " Replace mode
    elseif a:mode == 'R'
        return ' '
        " Visual mode
    elseif a:mode == 'v'
        return ' '
    elseif a:mode == 'V'
        return ' '
    elseif a:mode == "\<C-V>"
        return '礪'
        " Command mode
    elseif a:mode == 'c'
        return '⌘ '
        " Terminal mode
    elseif a:mode == 't'
        return 'ﰣ '
    endif
    return ''
endfunction

function! SetModifiedSymbol(modified) " {{{
    if a:modified == 1
        hi CustomStatuslineModifiedBody cterm=NONE gui=NONE ctermbg=1 ctermfg=0 guibg=#fc8993 guifg=#272c38
        hi CustomStatuslineModified cterm=NONE gui=NONE ctermbg=NONE ctermfg=1 guibg=NONE guifg=#fc8993
    else
        hi CustomStatuslineModifiedBody cterm=NONE gui=NONE ctermbg=0 ctermfg=2 guibg=#1d212a guifg=#89e19c
        hi CustomStatuslineModified cterm=NONE gui=NONE ctermbg=0 ctermfg=0 guibg=NONE guifg=#1d212a
    endif
    return ''
endfunction

function! SetFiletype(filetype) " {{{
    if winwidth(0) > 70
        hi CustomStatuslineFiletype          cterm=NONE   gui=NONE   ctermbg=NONE ctermfg=5 guibg=NONE    guifg=#d990cd
        hi CustomStatuslineFiletypeIcon      cterm=NONE   gui=NONE   ctermbg=5 ctermfg=0 guibg=#d990cd guifg=#272c38
        hi CustomStatuslineFiletypeBody      cterm=italic gui=italic ctermbg=8    ctermfg=5 guibg=#272c38 guifg=#d990cd
        hi CustomStatuslineFiletypeSeparator cterm=NONE   gui=NONE   ctermbg=NONE ctermfg=8 guibg=NONE    guifg=#272c38
        if a:filetype == ''
            return '-'
        else
            return a:filetype
        endif
    else
        hi CustomStatuslineFiletype          cterm=NONE   gui=NONE   ctermbg=NONE ctermfg=5 guibg=NONE    guifg=#1d212a
        hi CustomStatuslineFiletypeIcon      cterm=NONE   gui=NONE   ctermbg=5 ctermfg=0 guibg=#1d212a guifg=#1d212a
        hi CustomStatuslineFiletypeBody      cterm=italic gui=italic ctermbg=5    ctermfg=5 guibg=#1d212a guifg=#1d212a
        hi CustomStatuslineFiletypeSeparator cterm=NONE   gui=NONE   ctermbg=NONE ctermfg=5 guibg=NONE    guifg=#1d212a
        return ''
    endif
endfunction

function! Shiftwidth()
    let fname = expand('%:t')
    if ! &expandtab || fname == 'ControlP'
        return '-'
    endif
    if &shiftwidth == 0
        return &tabstop
    else
        return &shiftwidth
    endif
endfunction

" Setup the colors
hi StatusLine                cterm=NONE gui=NONE ctermbg=8 ctermfg=3 guibg=NONE guifg=NONE
hi CustomStatuslineSeparator cterm=NONE gui=NONE ctermbg=NONE ctermfg=8 guibg=NONE guifg=#272c38

hi CustomStatuslinePercentage     ctermfg=0 cterm=NONE ctermbg=NONE
hi CustomStatuslinePercentageBody ctermbg=0 cterm=NONE ctermfg=6

hi CustomStatuslineTotalLines     cterm=NONE gui=NONE ctermbg=NONE ctermfg=3 guibg=NONE guifg=#fbdf90
hi CustomStatuslineTotalLinesIcon cterm=NONE gui=NONE ctermbg=3 ctermfg=0 guibg=#fbdf90 guifg=#272c38
hi CustomStatuslineTotalLinesBody cterm=NONE gui=NONE ctermbg=8    ctermfg=3 guibg=#272c38 guifg=#fbdf90
hi CustomStatuslineTotalLinesSeparator cterm=NONE gui=NONE ctermbg=NONE ctermfg=8 guibg=NONE guifg=#272c38

hi CustomStatuslineInactiveDark           cterm=NONE gui=NONE ctermbg=8 ctermfg=12 guibg=#44506c guifg=#a7bdfb
hi CustomStatuslineInactiveDarkSeparator  cterm=NONE gui=NONE ctermbg=8 ctermfg=12 guibg=NONE    guifg=#272c38
hi CustomStatuslineInactiveLight          cterm=NONE gui=NONE ctermbg=8 ctermfg=12 guibg=NONE guifg=#44506c
hi CustomStatuslineInactiveLightSeparator cterm=NONE gui=NONE ctermbg=8 ctermfg=12 guibg=NONE    guifg=#44506c

function! SetActiveStatusLine()
    " Statusbar items
    let statusline  = "%{RedrawModeColors(mode())}"
    " Left side items
    " =======================
    let statusline .= "%#CustomStatuslineAccent#"
    let statusline .= "%#CustomStatuslineAccentBody#%{ModeIcon(mode())}"
    let statusline .= "%#CustomStatuslineFilename#\ %t\ "
    let statusline .= "%#CustomStatuslineSeparator#\ "
    " Modified status
    let statusline .= "%#CustomStatuslineModified#"
    let statusline .= "%#CustomStatuslineModifiedBody#%{SetModifiedSymbol(&modified)}"
    let statusline .= "%#CustomStatuslineModified#"
    " Right side items
    " =======================
    let statusline .= "%="
    " Git branch name
    let statusline .= "%#CustomStatuslineGitbranch#"
    let statusline .= "%#CustomStatuslineGitbranchSeparator#\ "
    " Padding
    let statusline .= "\ "
    " Current line / total number of lines
    let statusline .= "%#CustomStatuslineTotalLines#"
    let statusline .= "%#CustomStatuslineTotalLinesIcon# "
    let statusline .= "%#CUSTomStatuslineTotalLinesBody#\ %l"
    let statusline .= "\/\%#CUSTomStatuslineTotalLinesBody#%L"
    let statusline .= "%#CustomStatuslineTotalLinesSeparator#"
    " Padding
    let statusline .= "\ "
    " Filetype
    let statusline .= "%#CustomStatuslineFiletype#"
    let statusline .= "%#CustomStatuslineFiletypeBody#\ %{SetFiletype(&filetype)}"
    let statusline .= "%#CustomStatuslineFiletypeSeparator#\ "
    return statusline
endfunction

function! SetInactiveStatusLine()
    " Statusbar items
    let statusline  = "%{RedrawModeColors(mode())}"
    " Left side items
    " =======================
    let statusline .= "%#CustomStatuslineAccent#"
    let statusline .= "%#CustomStatuslineAccentBody#%{ModeIcon(mode())}"
    let statusline .= "%#CustomStatuslineFilename#\ %t\ "
    let statusline .= "%#CustomStatuslineSeparator#\ "
    " Modified status
    let statusline .= "%#CustomStatuslineModified#"
    let statusline .= "%#CustomStatuslineModifiedBody#%{SetModifiedSymbol(&modified)}"
    let statusline .= "%#CustomStatuslineModified#"
    " Right side items
    " =======================
    let statusline .= "%="
    " Git branch name
    let statusline .= "%#CustomStatuslineGitbranch#"
    let statusline .= "%#CustomStatuslineGitbranchSeparator#\ "
    " Padding
    let statusline .= "\ "
    " Current line / total number of lines
    let statusline .= "%#CustomStatuslineTotalLines#"
    let statusline .= "%#CustomStatuslineTotalLinesIcon# "
    let statusline .= "%#CUSTomStatuslineTotalLinesBody#\ %l"
    let statusline .= "\/\%#CUSTomStatuslineTotalLinesBody#%L"
    let statusline .= "%#CustomStatuslineTotalLinesSeparator#"
    " Padding
    let statusline .= "\ "
    " Filetype
    let statusline .= "%#CustomStatuslineFiletype#"
    let statusline .= "%#CustomStatuslineFiletypeBody#\ %{SetFiletype(&filetype)}"
    let statusline .= "%#CustomStatuslineFiletypeSeparator#\ "
    return statusline
endfunction

augroup vimrc-statusline
    autocmd!
    autocmd WinEnter * setlocal statusline=%!SetActiveStatusLine()
    autocmd BufEnter * setlocal statusline=%!SetActiveStatusLine()
    autocmd WinNew   * setlocal statusline=%!SetActiveStatusLine()
    autocmd WinLeave * setlocal statusline=%!SetActiveStatusLine()
augroup END
setlocal statusline=%!SetActiveStatusLine()
