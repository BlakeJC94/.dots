if has_key(get(g:, 'plugs', {}), 'gruvbox') == 0
  finish
endif

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
endfunction

autocmd VimEnter * call ColorMyGruvbox()

