if has_key(get(g:, 'plugs', {}), 'vim-signify') == 0
  finish
endif

let g:signify_sign_change = '~'
