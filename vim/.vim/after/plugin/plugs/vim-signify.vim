if has_key(get(g:, 'plugs', {}), 'vim-signify') == 0
  finish
endif

let g:signify_sign_change = '~'

"" Mappings
nnoremap <Leader>C <cmd>SignifyHunkDiff<CR>

augroup config_vim_fugitive
  au!
  " Auto-refresh gitsigns when updating git state via fugitive.vim
  au User FugitiveChanged SignifyRefresh
augroup END
