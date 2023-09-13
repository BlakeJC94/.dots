if has_key(get(g:, 'plugs', {}), 'undotree') == 0
  finish
endif

nnoremap <Leader>u <cmd>UndotreeToggle<CR>
