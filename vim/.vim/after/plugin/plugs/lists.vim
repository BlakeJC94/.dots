if has_key(get(g:, 'plugs', {}), 'lists.vim') == 0
  finish
endif

let g:lists_maps_default_enable = 0

nmap <Leader>x <plug>(lists-toggle)
" imap <CR> <plug>(lists-new-element)
