if has_key(get(g:, 'plugs', {}), 'vim-unimpaired') == 0
  finish
endif

" Don't error out on args pairs if argslist is empty
nnoremap [a <cmd>try <bar> exec 'norm \<Plug>(unimpaired-previous)' <bar> endtry <bar> args<CR>
nnoremap ]a <cmd>try <bar> exec 'norm \<Plug>(unimpaired-next)'     <bar> endtry <bar> args<CR>
nnoremap [A <cmd>try <bar> exec 'norm \<Plug>(unimpaired-first)'    <bar> endtry <bar> args<CR>
nnoremap ]A <cmd>try <bar> exec 'norm \<Plug>(unimpaired-last)'     <bar> endtry <bar> args<CR>

" Move visual selections of text up/down
vnoremap J <Plug>(unimpaired-move-selection-down)gv
vnoremap K <Plug>(unimpaired-move-selection-up)gv
