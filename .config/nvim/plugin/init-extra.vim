
" -- COLOURS ------------------------------------------------------------------
set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:invert_selection='0'
set background=dark
hi clear SpellBad
hi SpellBad cterm=bold,italic ctermfg=red
" -- FOLDS --------------------------------------------------------------------
" Custom fold text
function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1
    return ' >  '. foldedlinecount . line
endfunction
set foldtext=MyFoldText()
" note: had to copy and paste a special unicode space here!
set fillchars=fold: 
" -- NETRW OPTIONS ------------------------------------------------------------
let g:netrw_banner=0        " disable annoying banner
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" -- INTEGRATED TERMINAL ------------------------------------------------------
if has('nvim')
    " Use Alt + ; to go to normal mode
    tnoremap <A-;> <C-\><C-n>
    " Use Alt + Shift + ; to go to command mode
    tnoremap <A-:> <C-\><C-n>:
    cabbrev term <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'split term://bash' : 'term')<CR>
    cabbrev vterm <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vsplit term://bash' : 'vterm')<CR>
    augroup term_cmds
        autocmd!
        " Bypass normal mode when changing focus to terminal buffer
        autocmd BufWinEnter,WinEnter term://* startinsert
        " Toggle numbers off when in terminal mode, on when in normal mode
        autocmd TermEnter term://* setlocal nonu nornu
        autocmd TermLeave term://* setlocal nu rnu
        " Immediately close terminal window when process finishes
        autocmd TermClose term://* close
    augroup END
else
    " Use Alt + ; to go to normal mode
    tnoremap <A-:> <C-w><S-n>
    " Use Alt + Shift + ; to go to command mode
    tnoremap <A-:> <C-w><S-n>:
    cnoreabbrev vterm vert term
endif
" -- ABBREVIATIONS ------------------------------------------------------------
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev vterm vert term
cnoreabbrev fd %:p:h
" -- ARROW KEY MAPPINGS -------------------------------------------------------
" [Arrow] : navigate window in normal/visual, disable in insert
inoremap <expr>  <Left>  pumvisible() ? "\<C-e>" : ""
inoremap <expr>  <Down>  pumvisible() ? "\<C-n>" : ""
inoremap <expr>  <Up>    pumvisible() ? "\<C-p>" : ""
inoremap <expr>  <Right> pumvisible() ? "\<C-y>" : ""
nnoremap <Left>  4zh
nnoremap <Down>  4<C-e>
nnoremap <Up>    4<C-y>
nnoremap <Right> 4zl
vnoremap <Left>  4zh
vnoremap <Down>  4<C-e>
vnoremap <Up>    4<C-y>
vnoremap <Right> 4zl
" [Ctrl + Arrow] to navigate windows
if has('nvim')
    tnoremap <C-Left>  <C-\><C-N><C-w>h
    tnoremap <C-Down>  <C-\><C-N><C-w>j
    tnoremap <C-Up>    <C-\><C-N><C-w>k
    tnoremap <C-Right> <C-\><C-N><C-w>l
    inoremap <C-Left>  <C-\><C-N><C-w>h
    inoremap <C-Down>  <C-\><C-N><C-w>j
    inoremap <C-Up>    <C-\><C-N><C-w>k
    inoremap <C-Right> <C-\><C-N><C-w>l
else
    tnoremap <C-Left>  <C-w>h
    tnoremap <C-Down>  <C-w>j
    tnoremap <C-Up>    <C-w>k
    tnoremap <C-Right> <C-w>l
    inoremap <C-Left>  <C-w>h
    inoremap <C-Down>  <C-w>j
    inoremap <C-Up>    <C-w>k
    inoremap <C-Right> <C-w>l
endif
nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l
vnoremap <C-Left>  <C-w>h
vnoremap <C-Down>  <C-w>j
vnoremap <C-Up>    <C-w>k
vnoremap <C-Right> <C-w>l
" [Ctrl + Shift + Arrow] Move splits
if has('nvim')
    tnoremap <C-S-Left>  <C-\><C-N><C-w>H
    tnoremap <C-S-Down>  <C-\><C-N><C-w>J
    tnoremap <C-S-Up>    <C-\><C-N><C-w>K
    tnoremap <C-S-Right> <C-\><C-N><C-w>L
    inoremap <C-S-Left>  <C-\><C-N><C-w>H
    inoremap <C-S-Down>  <C-\><C-N><C-w>J
    inoremap <C-S-Up>    <C-\><C-N><C-w>K
    inoremap <C-S-Right> <C-\><C-N><C-w>L
else
    tnoremap <C-S-Left>  <C-w>H
    tnoremap <C-S-Down>  <C-w>J
    tnoremap <C-S-Up>    <C-w>K
    tnoremap <C-S-Right> <C-w>L
    inoremap <C-S-Left>  <C-w>H
    inoremap <C-S-Down>  <C-w>J
    inoremap <C-S-Up>    <C-w>K
    inoremap <C-S-Right> <C-w>L
endif
nnoremap <C-S-Left>  <C-w>H
nnoremap <C-S-Down>  <C-w>J
nnoremap <C-S-Up>    <C-w>K
nnoremap <C-S-Right> <C-w>L
vnoremap <C-S-Left>  <C-w>H
vnoremap <C-S-Down>  <C-w>J
vnoremap <C-S-Up>    <C-w>K
vnoremap <C-S-Right> <C-w>L
" [Ctrl + Alt + Arrow] : resize splits
if has('nvim')
    tnoremap <C-A-Left>  <C-\><C-N><C-w>8<
    tnoremap <C-A-Down>  <C-\><C-N><C-w>8-
    tnoremap <C-A-Up>    <C-\><C-N><C-w>8+
    tnoremap <C-A-Right> <C-\><C-N><C-w>8>
    inoremap <C-A-Left>  <C-\><C-N><C-w>8<
    inoremap <C-A-Down>  <C-\><C-N><C-w>8-
    inoremap <C-A-Up>    <C-\><C-N><C-w>8+
    inoremap <C-A-Right> <C-\><C-N><C-w>8>
else
    tnoremap <C-A-Left>  <C-w>8<
    tnoremap <C-A-Down>  <C-w>8-
    tnoremap <C-A-Up>    <C-w>8+
    tnoremap <C-A-Right> <C-w>8>
    inoremap <C-A-Left>  <C-w>8<
    inoremap <C-A-Down>  <C-w>8-
    inoremap <C-A-Up>    <C-w>8+
    inoremap <C-A-Right> <C-w>8>
endif
nnoremap <C-A-Left>  <C-w>8<
nnoremap <C-A-Down>  <C-w>8-
nnoremap <C-A-Up>    <C-w>8+
nnoremap <C-A-Right> <C-w>8>
vnoremap <C-A-Left>  <C-w>8<
vnoremap <C-A-Down>  <C-w>8-
vnoremap <C-A-Up>    <C-w>8+
vnoremap <C-A-Right> <C-w>8>
" ---- AUTOGROUPS -------------------------------------------------------------
augroup default_cmds
    autocmd!
    " equally resize windows when terminal is resized
    autocmd VimResized * wincmd =
    " replace tabs with spaces
    autocmd BufWritePre * retab
    " autoremove whitespace
    autocmd BufWritePre * :%s/\s\+$//e
augroup END
augroup textedit_cmds
    autocmd!
    autocmd BufEnter *.txt,*.md,*.tex setlocal
        \ spell spelllang=en_au linebreak wrap
    autocmd BufEnter *.tex inoremap ` `'<Left>
augroup END
augroup cursorline_on_active_buffer
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent!
        \ lua require'vim.highlight'.on_yank({timeout = 700})
augroup END
