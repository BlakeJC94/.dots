
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

