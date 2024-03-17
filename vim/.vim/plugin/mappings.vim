let mapleader = "\<Space>"


" Make Y behave like D and C
nnoremap Y y$
" Better jumplist for large line steps (and step through visual lines with j/k)
nnoremap <expr> j (v:count > 5 ? 'm`' . v:count : 'g') . 'j'
nnoremap <expr> k (v:count > 5 ? 'm`' . v:count : 'g') . 'k'
" gV: Visually select last pasted block (like gv)
nnoremap gV `[v`]
" gF: create new file at filename over cursor
nnoremap gF <cmd>e <c-r><c-f><CR>
" J doesn't move cursor
nnoremap J mzJ`z
" S splits line at cursor
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
" Better opening of URLs and files
nnoremap gx <cmd>silent execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)<CR>
" Maintain Visual Mode after >/</= actions
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv
" Swap p and P to stop losing register contents by pasting over
vnoremap P "_dp
vnoremap p "_dP
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

"" LEADER MAPS
nnoremap <special> <Leader><CR> :Fd ''<Left>
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>. <cmd>lcd %:p:h \| echo 'Changed local dir to ' . getcwd()<CR>
nnoremap <Leader>, <cmd>cd %:p:h \| echo 'Changed dir to ' . getcwd()<CR>
nnoremap <Leader>q <cmd>call functions#ToggleQuickFix()<CR>
nnoremap <Leader>l <cmd>exec functions#ToggleLocation()<CR>
nnoremap <Leader>; <cmd>edit ~/.vim/vimrc <bar> lcd %:p:h<CR>
nnoremap <Leader>m <cmd>Make -k %:p:t:r<CR>
nnoremap <Leader>G <cmd>Grep <cword> . <cr>
nnoremap <special> <Leader>g :Grep ''<Left>
nnoremap <Leader>w <C-w>
nnoremap <Leader>ww <C-w><C-w>
nnoremap <Leader>n <cmd>Note<CR>
nnoremap <Leader>N <cmd>split \| edit ~/Workspace/repos/field-notes/notes \| lcd %:p:h<CR>
