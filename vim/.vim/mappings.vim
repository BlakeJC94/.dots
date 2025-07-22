" Make Y behave like D and C
nnoremap Y y$

" Better jumplist for large line steps (and step through visual lines with j/k)
nnoremap <expr> j (v:count > 5 ? 'm`' . v:count : 'g') . 'j'
nnoremap <expr> k (v:count > 5 ? 'm`' . v:count : 'g') . 'k'

" gV: Visually select last pasted block (like gv)
nnoremap gV `[v`]
" gF: create new file at filename over cursor
nnoremap gF :e <c-r><c-f><CR>

" J doesn't move cursor
nnoremap J mzJ`z

" Make {/} don't change the jumplist
nnoremap { :<C-u>keepjumps norm! {<CR>
nnoremap } :<C-u>keepjumps norm! }<CR>

" Prevent x and s from overriding what's in the clipboard
nnoremap x "_x
nnoremap X "_X
nnoremap s "_s

" Open folds when flicking through search matches
nnoremap n nzv
nnoremap N Nzv

" Remap q and Q to stop polluting registers accidentally!
nnoremap q gw
nnoremap Q q
" nnoremap <silent> <C-l> :checktime<Bar>nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Maintain Visual Mode after >/</= actions
vnoremap < <gv
vnoremap = =gv
vnoremap > >gv

" Swap p and P to stop losing register contents by pasting over
vnoremap p "_dp
vnoremap P "_dP

" C-s : Quickly guess correct spelling errors (undoable)
inoremap <C-s> <C-g>u<Esc>a<C-g>u
nnoremap <C-s> i<C-g>u<Esc>[s1z=`]

" Stop accidentally opening help in insert mode
inoremap <F1> <nop>

" Windows and dirs
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>. <cmd>lcd %:p:h \| echo 'Changed local dir to ' . getcwd()<CR>
nnoremap <Leader>, <cmd>cd %:p:h \| echo 'Changed dir to ' . getcwd()<CR>
nnoremap <Leader>; <cmd>edit ~/.vim/vimrc <bar> lcd %:p:h<CR>
