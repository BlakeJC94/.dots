augroup default_cmds
    autocmd!
    " equally resize windows when terminal is resized
    autocmd VimResized * wincmd =
    " replace tabs with spaces
    autocmd BufWritePre * retab
    " autoremove whitespace
    autocmd BufWritePre * %s/\s\+$//e
    " help/cmd win/qf list: Press q to close and disable spellcheck
    autocmd Filetype qf,help nnoremap <buffer> q :q<CR>
    autocmd Filetype qf,help setl nospell
    autocmd CmdwinEnter * nnoremap <buffer> q :q<CR>
    " Autocomplete braces in C files
    " autocmd FileType c inoremap {<CR> {<CR><CR>}<C-o>k<Tab>
    " Autoindent python structures
    autocmd FileType python setl
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    " create nested directories if needed when creating files
    autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
augroup END

augroup set_prgs
    autocmd!
    autocmd FileType c set formatprg=clang-format
    " autocmd FileType Markdown set makeprg=pandoc\ %:p\ -o\ %:p:h/out.pdf
augroup END


augroup cursorline_on_active_buffer
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter,Focusgained * setlocal cursorline
    autocmd WinLeave,FocusLost * setlocal nocursorline
    autocmd VimEnter,WinEnter,BufWinEnter,Focusgained term://* setl nocursorline
augroup END


augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent!
        \ lua require'vim.highlight'.on_yank({timeout = 700})
augroup END


augroup term_cmds
    autocmd!
    " Bypass normal mode when changing focus to terminal buffer
    autocmd BufWinEnter,WinEnter term://* startinsert
    " Disable numbers and spelling in terminals
    autocmd TermOpen term://* setlocal nonu nornu nospell
    " Immediately close terminal window when process finishes
    autocmd TermClose term://* quit
augroup END
