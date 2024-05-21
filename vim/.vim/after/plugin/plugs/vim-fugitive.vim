if has_key(get(g:, 'plugs', {}), 'vim-fugitive') == 0
  finish
endif


"" Mappings
nnoremap <Leader>c <cmd>call ToggleGstatus()<CR>
vnoremap <leader>b :GBrowse!<CR>

"" Functions
function! ToggleGstatus() abort
    let l:foo = 0
    for l:winnr in range(1, winnr('$'))
        if !empty(getwinvar(l:winnr, 'fugitive_status')) && getwinvar(l:winnr, '&ft') == 'fugitive'
            execute l:winnr.'close'
            let l:foo = 1
            break
        endif
    endfor
    if l:foo == 0
        Git
    endif
endfunction

"" Autocommands
augroup config_vim_fugitive
  au!
  " Auto-refresh status
  au BufWritePre,FileWritePre * call fugitive#ReloadStatus()
  " Autostart insert mode when committing
  au BufEnter COMMIT_EDITMSG startinsert
augroup END

