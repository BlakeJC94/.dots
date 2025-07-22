iabbrev <expr> @@d strftime('%Y-%m-%d')
iabbrev <expr> @@t strftime('%Y-%m-%dT%T%z')[:21] . ':00'

inoreabbrev <expr> ,u system('uuidgen')->trim()->tolower()

inoreabbrev rbm # TODO: remove before merging
inoreabbrev cbm # TODO: change before merging
inoreabbrev ubm # TODO: uncomment before merging

" Expand `%%` as current filename in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" C-q : Code fence in insert mode <>
inoremap <C-q> <cmd>exec 'norm! i```<C-o>O```<Space>' \| startinsert<CR>
" C-v : Code block in insert mode <>
inoremap <C-v> <cmd>exec 'norm! i%%<C-o><Plug>CommentaryLine<C-o>A ' \| startinsert<CR>
