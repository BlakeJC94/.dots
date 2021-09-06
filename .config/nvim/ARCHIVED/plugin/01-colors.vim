
set termguicolors
set background=dark
let g:invert_selection='0'
let g:gruvbox_contrast_dark='hard'
augroup fix_syntax_backgrounds
    autocmd!
    " autocmd Colorscheme * hi Normal guibg='#1d2021' ctermbg=NONE
    autocmd Colorscheme * hi Normal guibg=NONE ctermbg=NONE
    autocmd Colorscheme * hi GrammarousError gui=undercurl guisp='#98971a'
    autocmd FileType markdown hi markdownItalic gui=italic
    autocmd FileType markdown hi markdownBoldItalic gui=bold,italic
augroup END
colorscheme gruvbox

" Quickscope options
let g:qs_max_chars=800
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
function! SetQSColors()
    hi QuickScopePrimary guifg='#66b2ff' gui=underline
    hi QuickScopeSecondary guifg='#ff66b2' gui=underline
endfunction
call SetQSColors()

" Attempt to preserve color changes on goyo
autocmd! User GoyoLeave nested call SetQSColors()

" Use this function to diagnose bad syntax
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
