
augroup default_cmds
    autocmd!
    " equally resize windows when terminal is resized
    autocmd VimResized * wincmd =
    " replace tabs with spaces
    autocmd BufWritePre * retab
    " autoremove whitespace
    autocmd BufWritePre * call TrimTrailingSpace()
    " Auto-highlight yanked text
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 700})
    " create nested directories if needed when creating files
    autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
augroup END


augroup extra_filetype_cmds
    " help/cmd win/qf list: Press q to close and disable spellcheck
    autocmd Filetype qf,help nnoremap <buffer> q :q<CR>
    autocmd Filetype qf,help setl nospell
    autocmd CmdwinEnter * nnoremap <buffer> q :q<CR>
augroup END


augroup set_prgs
    autocmd!
    autocmd FileType c set formatprg=clang-format
    " autocmd FileType Markdown set makeprg=pandoc\ %:p\ -o\ %:p:h/out.pdf
augroup END

augroup toggle_cursorline
    autocmd InsertEnter * set cursorline
    autocmd InsertLeave * set nocursorline
augroup END

" augroup lang_tweaks
    " Autocomplete braces in C files
    " autocmd FileType c inoremap {<CR> {<CR><CR>}<C-o>k<Tab>
    " Autoindent python structures
    " autocmd FileType python setl
    "     \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
" augroup END



" (probably not needed?)
" augroup auto_mkdir
"   autocmd!
"   autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
"   function! s:auto_mkdir(dir, force)
"     if !isdirectory(a:dir)
"           \   && (a:force
"           \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
"       call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
"     endif
"   endfunction
" augroup END

" (replaced by focus plugin)
" augroup cursorline_on_active_buffer
"     autocmd!
"     autocmd VimEnter,WinEnter,BufWinEnter,Focusgained * setlocal cursorline
"     autocmd WinLeave,FocusLost * setlocal nocursorline
"     autocmd VimEnter,WinEnter,BufWinEnter,Focusgained term://* setl nocursorline
" augroup END


augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent!
        \ lua require'vim.highlight'.on_yank({timeout = 700})
augroup END


" replaced with toggleterm
" augroup term_cmds
"     autocmd!
"     " Bypass normal mode when changing focus to terminal buffer
"     autocmd BufWinEnter,WinEnter term://* startinsert
"     " Disable numbers and spelling in terminals
"     autocmd TermOpen term://* setlocal nonu nornu nospell
"     " Immediately close terminal window when process finishes
"     autocmd TermClose term://* quit
" augroup END
