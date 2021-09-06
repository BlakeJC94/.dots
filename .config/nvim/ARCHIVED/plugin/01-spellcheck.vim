set spell  " Enable spellcheck by default

" C-s : Quickly correct spelling errors (undoable)
inoremap <C-s> <C-g>u<Esc>[S1z=`]a<c-g>u
nnoremap <C-s> m`i<C-g>u<Esc>[S1z=i<C-g>u<Esc>``

" C-q : Add word to spellfile (occupies mark q)
inoremap <C-q> <Esc>[Smqzg`]a
nnoremap <C-q> m`[Smqzg``
" C-z : Undo last add word to spellfile
" inoremap <expr> <C-z> (CheckqMark() == 1 ? "\<Esc>`qzw`]:delm q\<CR>a" : "\<C-z>")
nnoremap <expr> <C-z> (CheckqMark() == 1 ? "m``qzw\<C-o>:delm q\<CR>" : "")
" helper function for removing recently added word to spellfile
function! CheckqMark()
    try | marks q | return 1 | catch | return 0 | endtry
endfunction

" L-. Toggle spellcheck
nnoremap <Leader>. :set spell!<CR>
" L-;, L-, : Jump between spelling mistakes
nnoremap <Leader>; ]s
nnoremap <Leader>, [s

" L-S-. : Activate grammar check
nnoremap <Leader>> :GrammarousCheck<CR>
" L-S-;, L-S-, : Navigate grammar errors after activating grammar checker
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer> <Leader>: <Plug>(grammarous-move-to-next-error)
    nmap <buffer> <Leader>< <Plug>(grammarous-move-to-previous-error)
    nnoremap <Leader>> <Plug>(grammarous-fixit)
endfunction
function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer> <Leader>:
    nunmap <buffer> <Leader><
    nnoremap <Leader>> :GrammarousCheck<CR>
endfunction
" disable some rules
let g:grammarous#disabled_rules = {
    \ '*' : ['DASH_RULE', 'WHITESPACE_RULE', 'EN_QUOTES'],
    \ }
