
" <Esc><Esc> = go to normal mode
tnoremap <Esc><Esc> <C-\><C-n>
" <Esc>: = go to normal mode
tnoremap <Esc>: <C-\><C-n>:

" terminal command shortcuts
cabbrev term <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'split term://bash' : 'term')<CR>
cabbrev vterm <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vsplit term://bash' : 'vterm')<CR>

" terminal autocmds
augroup term_cmds
    autocmd!
    " Bypass normal mode when changing focus to terminal buffer
    autocmd BufWinEnter,WinEnter term://* startinsert
    " Disable numbers and spelling in terminals
    autocmd TermOpen term://* setlocal nonu nornu nospell
    " Immediately close terminal window when process finishes
    autocmd TermClose term://* quit
augroup END

" Vim-slime options
let g:slime_target = has('nvim') ? "neovim" : "vimterminal"
let g:slime_target = has('nvim') ? "neovim" : "vimterminal"
let g:slime_python_ipython = 1

" Switch off limelight when entering terminal
augroup limelight_term
    autocmd!
    autocmd TermEnter * Limelight!
augroup END
