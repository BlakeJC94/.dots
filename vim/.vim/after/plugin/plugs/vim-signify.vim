let g:signify_sign_change = '~'

augroup config_vim_fugitive
  au!
  " Auto-refresh gitsigns when updating git state via fugitive.vim
  au User FugitiveChanged SignifyRefresh
augroup END

nnoremap <Leader>C <cmd>SignifyHunkDiff<CR>
nnoremap <leader>h <cmd>SignifyHunkFold<CR>
nnoremap <leader>H <cmd>SignifyHunkUndo<CR>

omap ih <plug>(signify-motion-inner-pending)
xmap ih <plug>(signify-motion-inner-visual)
omap ah <plug>(signify-motion-outer-pending)
xmap ah <plug>(signify-motion-outer-visual)

autocmd User SignifyHunk call s:show_current_hunk()

function! s:show_current_hunk() abort
  let h = sy#util#get_hunk_stats()
  if !empty(h)
    echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
  endif
endfunction
