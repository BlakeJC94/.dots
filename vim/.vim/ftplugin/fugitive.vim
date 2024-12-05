" q to exit Fugitive
nnoremap <buffer> q <cmd>q<CR>

" p/P to pull/push (Press <CR> to confirm)
nnoremap <buffer> p :Git pull
nnoremap <buffer> P :Git push

" <Tab> to explore branches
nnoremap <buffer> <tab> <cmd>Twiggy<CR>

" Fugitive buffers as scratch buffers
call functions#SetScratchBuffer()
