function! s:ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
endfunction

function! s:ToggleLocation()
    if empty(filter(getwininfo(), 'v:val.loclist'))
      try
        lopen
      catch /^Vim\%((\a\+)\)\=:E776:/
        echo 'No location list'
      endtry
    else
      lclose
    endif
endfunction

command! ToggleQL :call s:ToggleQuickFix()
command! ToggleLL :call s:ToggleLocation()

nnoremap <Leader>q <cmd>ToggleQL<CR>
nnoremap <Leader>l <cmd>ToggleLL<CR>
