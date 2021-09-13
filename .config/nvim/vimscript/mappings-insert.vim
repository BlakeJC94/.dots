"
" C-s : Quickly correct spelling errors (undoable)
inoremap <C-s> <C-g>u<Esc>[S1z=`]a<c-g>u

" Insert undo breakpoints when typing punctuation
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap ( (<C-g>u
inoremap ) )<C-g>u
inoremap [ [<C-g>u
inoremap ] ]<C-g>u
inoremap { {<C-g>u
inoremap } }<C-g>u
inoremap < <<C-g>u
inoremap > ><C-g>u
inoremap ' '<C-g>u
inoremap " "<C-g>u
inoremap ` `<C-g>u

" Use <Tab> and <S-Tab> to navigate through autocomplete menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" C-z from insert mode does undo
inoremap <C-z> <C-o>u
inoremap <A-z> <C-o><C-r>
