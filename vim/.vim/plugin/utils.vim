command! -nargs=* Cexpr cexpr system(expand(<q-args>))
command! -nargs=* Fd cexpr system('fd ' . expand(<q-args>))
command! -nargs=* -complete=file_in_path Grep cexpr system(&grepprg . ' ' . expand(<q-args>))

" command! -nargs=* -complete=file_in_path Open silent! execute '!' . (system('uname') =~ "darwin" ? '' : 'xdg-') . 'open ' . shellescape(expand(len(<q-args>) ? <q-args> : '%:p'), 1) . ' > /dev/null 2>&1 &' | redraw!
" let g:loaded_openPlugin = 1  " TODO Check that vim9 :Open works as expected

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
" S splits line at cursor <>
nnoremap S i<CR><Esc>k:sil! keepp s/\\v +$//<CR>:noh<CR>==j^

" Make {/} don't change the jumplist
nnoremap { :<C-u>keepjumps norm! {<CR>
nnoremap } :<C-u>keepjumps norm! }<CR>

" Change selected word (forward/backwards), `.` to repeat
nnoremap c* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgN
" Delete selected word (forward/backwards), `.` to repeat
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN

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
nnoremap <silent> <C-l> :checktime<Bar>nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Maintain Visual Mode after >/</= actions
vnoremap < <gv
vnoremap = =gv
vnoremap > >gv

" Swap p and P to stop losing register contents by pasting over
vnoremap p "_dp
vnoremap P "_dP

" C-s : Quickly guess correct spelling errors (undoable)
inoremap <C-s> <C-g>u<Esc>[s1z=`]a<C-g>u
nnoremap <C-s> i<C-g>u<Esc>[s1z=`]

" Expand `%%` as current filename in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Stop accidentally opening help in insert mode
inoremap <F1> <nop>

" Operation for */# in visual mode
xnoremap * :<C-u>call functions#VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call functions#VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" C-q : Code fence in insert mode <>
inoremap <C-q> <cmd>exec 'norm! i```<C-o>O```<Space>' \| startinsert<CR>
" C-v : Code block in insert mode <>
inoremap <C-v> <cmd>exec 'norm! i%%<C-o><Plug>CommentaryLine<C-o>A ' \| startinsert<CR>

" Use unused arrow keys
nmap <Left> [
nmap <Right> ]
nmap <Up> [
nmap <Down> ]

" Fkey maps
nnoremap <F1> <cmd>setl relativenumber!<CR><cmd>setl relativenumber?<CR>
nnoremap <F2> <cmd>setl number!<CR><cmd>setl number?<CR>
nnoremap <F3> <cmd>setl wrap!<CR><cmd>setl wrap?<CR>
nnoremap <F4> <cmd>setl spell!<CR><cmd>setl spell?<CR>
nnoremap <F6> <cmd>wincmd =<CR>
" Resize split maps
nnoremap <C-Left>  <cmd>8wincmd <<CR>
nnoremap <C-Up>    <cmd>4wincmd +<CR>
nnoremap <C-Down>  <cmd>4wincmd -<CR>
nnoremap <C-Right> <cmd>8wincmd ><CR>



" Fd
nnoremap <special> <Leader><CR> :Fd ''<Left>

" Windows and dirs
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>. <cmd>lcd %:p:h \| echo 'Changed local dir to ' . getcwd()<CR>
nnoremap <Leader>, <cmd>cd %:p:h \| echo 'Changed dir to ' . getcwd()<CR>
nnoremap <Leader>; <cmd>edit ~/.vim/vimrc <bar> lcd %:p:h<CR>
nnoremap <Leader>w <C-w>
nnoremap <Leader>ww <C-w><C-w>

" Notes
nnoremap <Leader>n <cmd>Note<CR>
nnoremap <Leader>N <cmd>split \| edit ~/Workspace/repos/field-notes/notes \| lcd %:p:h<CR>

" Signify
nnoremap <Leader>C <cmd>SignifyHunkDiff<CR>
nnoremap <leader>h <cmd>SignifyHunkFold<CR>
nnoremap <leader>H <cmd>SignifyHunkUndo<CR>


" Ale
nnoremap <Leader>L <cmd>ALEPopulateLocList<cr>
nnoremap <Leader>= <cmd>ALEFix<cr>

" Fzf
nnoremap <Leader><BS> <cmd>Files<CR>
nnoremap <Leader><CR> <cmd>Buffers<CR>
nnoremap <leader>fh <cmd>Helptags<CR>
nnoremap <leader>fo <cmd>History<CR>
nnoremap <leader>f/ <cmd>History/<CR>
nnoremap <leader>f: <cmd>History:<CR>
nnoremap <leader>fk <cmd>Maps<CR>

" Undotree
nnoremap <Leader>u <cmd>UndotreeToggle<CR>

" Fugitive
nnoremap <Leader>c <cmd>call ToggleGstatus()<CR>
vnoremap <leader>b :GBrowse!<CR>



" A place for random ideas and trying new snippets
function! s:Foo()
  return 420
endfunction

function! s:ScratchMain()
  let val = s:Foo()
  echo val
endfunction


" command ScratchMain :call s:ScratchMain()
"
