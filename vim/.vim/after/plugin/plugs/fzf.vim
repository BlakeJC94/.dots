
" TODO
" command! -bang CwdHistory call fzf#run(fzf#wrap(s:preview(<bang>0, {
"   \ 'source': s:file_history_from_directory(getcwd()),
"   \ 'options': [
"   \   '--prompt', 'CwdHistory> ',
"   \   '--multi',
"   \ ]}), <bang>0))

nnoremap <Leader><BS> <cmd>Files<CR>
nnoremap <Leader>fb <cmd>Buffers<CR>
" nnoremap <leader>fo <cmd>CwdHistory<CR>
nnoremap <leader>fO <cmd>History<CR>
nnoremap <leader>fh <cmd>Helptags<CR>
nnoremap <leader>fg <cmd>RG<CR>
