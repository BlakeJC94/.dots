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
" Better opening of URLs and files
nnoremap gx <cmd>silent execute 'Start ' . (system('uname') =~ "Darwin" ? '' : 'xdg-') . 'open ' . shellescape(expand('<cfile>'), 1)<CR>
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
" gS : Sort motion in normal mode <>
nmap <silent> gS :set opfunc=functions#Sort<CR>g@
" gS : Sort action in visual mode <>
vmap <silent> gS :sort<CR>
" gr: Reverse lines, selected or over motion. <>
nnoremap <silent> gr :set opfunc=functions#ReverseLines<CR>g@
vnoremap <silent> gr :<C-u>call functions#ReverseLines('vis')<CR>
" <Esc><Esc>: Terminal normal mode
" tnoremap <C-w><Space> <C-w>N
" Restore <C-w> in terminal mode
tnoremap <C-w>w <C-w>.
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
