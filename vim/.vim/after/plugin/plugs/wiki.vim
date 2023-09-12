if has_key(get(g:, 'plugs', {}), 'wiki.vim') == 0
  finish
endif

nnoremap <Leader>ww <cmd>WikiIndex<cr>
nnoremap <Leader>wn <cmd>WikiOpen<cr>
nnoremap <Leader>wx <cmd>WikiReload<cr>

let g:wiki_root = '~/Workspace/repos/field-notes/notes'
let g:wiki_index_name = '_index_'
let g:wiki_mappings_use_defaults = 'local'
let g:wiki_link_creation = {
  \'_': {
    \'link_type': 'wiki',
    \},
  \'md': {
    \'link_type': 'wiki',
    \'url_extension': '',
    \'url_transform': {x -> functions#Slugify(x)},
    \},
  \}
