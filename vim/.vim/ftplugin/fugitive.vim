" q to exit Fugitive
nnoremap <buffer> q <cmd>q<CR>

" p/P to pull/push (Press <CR> to confirm)
nnoremap <buffer> p :Git pull
nnoremap <buffer> P :Git push

" <Tab> to explore branches
nnoremap <buffer> <tab> <cmd>Twiggy<CR>

" CC to fire up commitizen
nnoremap <buffer> CC <cmd>term ++close cz commit<cr>

" Fugitive buffers as scratch buffers
call functions#SetScratchBuffer()
