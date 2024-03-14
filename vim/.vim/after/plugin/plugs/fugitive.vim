if has_key(get(g:, 'plugs', {}), 'vim-fugitive') == 0
  finish
endif


"" Mappings
nnoremap <Leader>c <cmd>call ToggleGstatus()<CR>
vnoremap <leader>b :GBrowse! main:%<cr>

"" Functions
function SetFugitiveScratch() abort
  setl bufhidden=delete
  setl buftype=nofile
  setl nomodifiable
  " TODO Set buffer name as commit hash?
endfun

function! ToggleGstatus() abort
    for l:winnr in range(1, winnr('$'))
        if !empty(getwinvar(l:winnr, 'fugitive_status'))
            execute l:winnr.'close'
        else
            Git
        endif
    endfor
endfunction


"" Autocommands
augroup config_vim_fugitive
  au!
  " Auto-refresh status
  au BufWritePre,FileWritePre * call fugitive#ReloadStatus()
  " Fugitive buffers as scratch buffers
  au BufReadPost fugitive://* call SetFugitiveScratch()
  " q to exit Fugitive
  au BufReadPost fugitive://* nnoremap <buffer> q <cmd>q<CR>
augroup END

