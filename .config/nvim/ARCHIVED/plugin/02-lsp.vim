
augroup auto_lsp_errors_llist
    autocmd!
    autocmd! BufWritePre,InsertLeave * :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
augroup END


" L-h/l : Open/close location list with LSP errors
nnoremap <Leader>h :lua vim.lsp.diagnostic.set_loclist({open_loclist = true})<CR>
nnoremap <Leader>l :lclose<CR>
" L-j,k : Navigate errors that automatically show in location list
nnoremap <Leader>j :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})<CR>:lnext<CR>:lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <Leader>k :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})<CR>:lprev<CR>:lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
