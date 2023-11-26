if has_key(get(g:, 'plugs', {}), 'vim-fugitive') == 0
  finish
endif


"" Mappings
nnoremap <Leader>cc <cmd>Git<CR>

"" Functions
function SetFugitiveScratch()
  setl bufhidden=delete
  setl buftype=nofile
  setl nomodifiable
  " TODO Set buffer name as commit hash?
endfun

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

