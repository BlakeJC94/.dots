let g:gruvbox_italic = 1
let g:invert_selection = 0
let g:gruvbox_contrast_dark = 'hard'

function ColorMyGruvbox()
    if has_key(get(g:, 'plugs', {}), 'gruvbox') == 0
        finish
    endif

    set background=dark
    set termguicolors

    colorscheme gruvbox
    hi link CellBoundary SpecialComment
    hi link pythonSpaceError Normal
    hi Folded guibg=#282828
    hi link MessageWindow GruvboxFg0
    hi clear StatusLineTerm
    hi clear StatusLineTermNC
    hi link StatusLineTerm StatusLine
    hi link StatusLineTermNC StatusLineNC

    if exists('$TMUX')
        highlight Normal ctermbg=NONE guibg=NONE
    endif
endfunction

call ColorMyGruvbox()
autocmd ColorScheme gruvbox call ColorMyGruvbox()
