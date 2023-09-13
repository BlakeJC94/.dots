" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" fixes glitch? in colors when using vim with tmux/wezterm
set background=dark
set t_Co=256
set termguicolors

" Wezterm undercurl fix
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

" Gruvbox config
let g:gruvbox_italic = 1
let g:invert_selection = 0
let g:gruvbox_contrast_dark = 'hard'

" Gruvbox overrides
autocmd ColorScheme * hi link CellBoundary SpecialComment
" exec 'hi SyntasticErrorSign guifg=red ctermfg=red ' . (has("gui_running")? 'guibg=':'ctermbg=') . synIDattr(hlID('SignColumn'),'bg')

" Schedule colorscheme change
" autocmd VimEnter * colorscheme gruvbox
colorscheme gruvbox
