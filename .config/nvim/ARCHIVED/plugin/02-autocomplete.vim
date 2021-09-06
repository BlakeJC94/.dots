
" Autocomplete menu options
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set shortmess+=c  " Hide extra message when using completion

" Use <Tab> and <S-Tab> to navigate through autocomplete menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make vertical wildmenu controls behave intuitively
if match(&wildmode, 'full') > -1
    cnoremap <expr> <Down>  wildmenumode() ? "\<Right>" : "\<Down>"
    cnoremap <expr> <Up>    wildmenumode() ? "\<Left>"  : "\<Up>"
    cnoremap <expr> <Right> wildmenumode() ? "\<Down>"  : "\<Right>"
    cnoremap <expr> <Left>  wildmenumode() ? "\<Up>"    : "\<Left>"
endif

" Use / and <Tab> to cycle through partial matches
cnoremap <expr> <Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ?
            \ "\<CR>/\<C-r>/" : "\<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ?
            \ "\<CR>?\<C-r>/" : "\<S-Tab>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"  " select from compe w/ <CR>
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

