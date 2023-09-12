let g:fzf_history_dir = '~/.local/share/fzf-history'

function! FzfHistoryCwd()
  return fzf#vim#_uniq(map(
    \ filter([expand('%')], 'len(v:val)')
    \   + filter(map(fzf#vim#_buflisted_sorted(), 'bufname(v:val)'), 'len(v:val)')
    \   + filter(copy(v:oldfiles), "filereadable(fnamemodify(v:val, ':p')) && v:val =~ getcwd()"),
    \ 'fnamemodify(v:val, ":~:.")'))
endfunction

command! -bang HistoryCwd call fzf#run(fzf#wrap('history-cwd', {
  \ 'source': FzfHistoryCwd(),
  \ 'options': [
  \   '--prompt', 'HistoryCwd> ',
  \   '--multi',
  \ ]}, <bang>0))

nnoremap <Leader><BS> <cmd>Files<CR>
nnoremap <Leader>fb <cmd>Buffers<CR>
nnoremap <leader>fo <cmd>HistoryCwd<CR>
nnoremap <leader>fO <cmd>History<CR>
nnoremap <leader>fh <cmd>Helptags<CR>
nnoremap <leader>fg <cmd>Rg<CR>

