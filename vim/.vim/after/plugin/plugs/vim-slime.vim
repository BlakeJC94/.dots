if has_key(get(g:, 'plugs', {}), 'vim-slime') == 0
  finish
endif

let g:slime_python_ipython = 1
let g:slime_target = "vimterminal"
let g:slime_paste_file = tempname() . "_slime"
let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{last}'}

let g:slime_cell_delimiter = "^\\(\\s*\\(\\#\\|--\\) \\(%%\\|In\\[\\d\\+\\]\\)\\|```\\)"
let g:slime_dont_ask_default = 1
let g:slime_bracketed_paste = 1
let g:slime_no_mappings = 0

nmap <C-c>c     <Plug>SlimeConfig
nmap <C-c><C-c> <Plug>SlimeCellsSendAndGoToNext
nmap <C-c>j     <Plug>SlimeCellsNext
nmap <C-c>k     <Plug>SlimeCellsPrev
xmap <C-c><C-c> <Plug>SlimeRegionSend

augroup clear_slime
  autocmd!
  autocmd VimLeave * for i in glob('/tmp/**/*_slime', 1, 1) | call delete(i) | endfor
augroup END

autocmd FileType python let b:slime_vimterminal_cmd='uv run ipython'
