if has_key(get(g:, 'plugs', {}), 'vim-slime') == 0
  finish
endif

nnoremap <C-c>c     <Plug>SlimeConfig
nnoremap <C-c><C-c> <Plug>SlimeCellsSendAndGoToNext
nnoremap <C-c>j     <Plug>SlimeCellsNext
nnoremap <C-c>k     <Plug>SlimeCellsPrev
xnoremap <C-c><C-c> <Plug>SlimeRegionSend

let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:slime_paste_file = tempname() . "_slime"
let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{last}'}

let g:slime_cell_delimiter = "^\\s*# %%"
let g:slime_dont_ask_default = 1
let g:slime_bracketed_paste = 1
let g:slime_no_mappings = 1

augroup clear_slime
  autocmd!
  autocmd VimLeave * for i in glob('/tmp/**/*_slime', 1, 1) | call delete(i) | endfor
augroup END
