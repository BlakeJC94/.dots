" q to exit Fugitive
nnoremap <buffer> q <cmd>q<CR>

" p/P to pull/push (Press <CR> to confirm)
nnoremap <buffer> p :Git pull
nnoremap <buffer> P :Git push

" Fugitive buffers as scratch buffers
setl bufhidden=delete
setl buftype=nofile
setl nomodifiable
