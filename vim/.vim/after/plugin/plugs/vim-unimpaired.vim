" Don't error out on args pairs if argslist is empty
nmap [a <cmd>try <bar> exec 'norm \<Plug>(unimpaired-previous)' <bar> endtry <bar> args<CR>
nmap ]a <cmd>try <bar> exec 'norm \<Plug>(unimpaired-next)'     <bar> endtry <bar> args<CR>
nmap [A <cmd>try <bar> exec 'norm \<Plug>(unimpaired-first)'    <bar> endtry <bar> args<CR>
nmap ]A <cmd>try <bar> exec 'norm \<Plug>(unimpaired-last)'     <bar> endtry <bar> args<CR>

" Move visual selections of text up/down
vmap J <Plug>(unimpaired-move-selection-down)gv
vmap K <Plug>(unimpaired-move-selection-up)gv
