if has_key(get(g:, 'plugs', {}), 'wiki.vim') == 0
  finish
endif

nnoremap <Leader>ww <plug>(wiki-index)
nnoremap <Leader>wn <plug>(wiki-open)
nnoremap <Leader>wj <plug>(wiki-journal)
nnoremap <Leader>wx <plug>(wiki-reload)

let g:wiki_root = '~/Workspace/repos/field-notes/notes'
let g:wiki_index_name = '_index_'
let g:wiki_mappings_use_defaults = 'local'
let g:wiki_link_creation = {
  \'md': {
    \'link_type': 'wiki',
    \'url_extension': '',
    \'url_transform': {x -> functions#Slugify(x)},
    \},
  \}
