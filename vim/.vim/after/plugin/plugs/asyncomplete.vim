
let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

autocmd User asyncomplete_setup call asyncomplete#register_source(
  \ asyncomplete#sources#unicodesymbol#get_source_options({
  \   'name': 'unicodesymbol',
  \   'whitelist': ['julia'],
  \   'completor': function('asyncomplete#sources#unicodesymbol#completor'),
  \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': [],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

function! s:fix_buffer_complete() abort
    let l:info = asyncomplete#get_source_info('buffer')
    call l:info.on_event(l:info, {}, 'BufWinEnter')
endfunction
autocmd User asyncomplete_setup call s:fix_buffer_complete()

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))
