
" Better splitting
nnoremap _ :split<CR>
nnoremap \| :vsplit<CR>

" <Esc><Esc> = (terminal) go to normal mode
tnoremap <Esc><Esc> <C-\><C-n>
" <Esc>: = (terminal) go to command mode
tnoremap <Esc>: <C-\><C-n>:

" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_X

" Make <C-a/x> incrrease/decrease recursively in vblock mode
vnoremap <C-a> g<C-a>
vnoremap <C-x> g<C-x>
vnoremap g<C-a> <C-a>
vnoremap g<C-x> <C-x>

" Center screen and open folds when flicking through search matches
nnoremap n nzzzv
nnoremap N Nzzzv

" Maintain Visual Mode after >/< actions
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Move visual block up or down
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv

" Make Y behave like D and C
" nmap Y y$

" Open/close quickfix list with <C-l> (custom function)
nnoremap <C-l> :call ToggleQuickFix()<CR>
" Navigate quickfix list with <C-j/k>
nnoremap <C-j> :cnext<CR>zzzv
nnoremap <C-k> :cprev<CR>zzzv

" gp: Visually select last pasted block (like gv)
nnoremap <expr> gp '`[' . getregtype()[0] . '`]'

" gF: create new file at filename over cursor
nnoremap gF :e <c-r><c-f><CR>

" J doesn't move cursor
nnoremap J mzJ`z

" " Backspace/Enter in normal mode for jumplist
" nnoremap <Backspace> <C-o>
" nnoremap <CR> <C-i>

" Better jumplist for large line steps
nnoremap <expr> k (v:count > 5 ? "m`" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m`" . v:count : "") . 'j'

" Change selected word (forward/backwards), . to repeat
nnoremap c* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgN

" Delete selected word (forward/backwards), . to repeat
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN

" Make vertical wildmenu controls behave intuitively
if match(&wildmode, 'full') > -1
    cnoremap <expr> <Down>  wildmenumode() ? "\<Right>" : "\<Down>"
    cnoremap <expr> <Up>    wildmenumode() ? "\<Left>"  : "\<Up>"
    cnoremap <expr> <Right> wildmenumode() ? "\<Down>"  : "\<Right>"
    cnoremap <expr> <Left>  wildmenumode() ? "\<Up>"    : "\<Left>"
endif

" [Arrow] : disable for all
map <Left>  <Nop>
map <Down>  <Nop>
map <Up>    <Nop>
map <Right> <Nop>

" [Shift + Arrow] : scroll window
nnoremap <S-Left>  4zh
nnoremap <S-Down>  4<C-e>
nnoremap <S-Up>    4<C-y>
nnoremap <S-Right> 4zl
vnoremap <S-Left>  4zh
vnoremap <S-Down>  4<C-e>
vnoremap <S-Up>    4<C-y>
vnoremap <S-Right> 4zl
" inoremap <S-Left>  <C-o>4zh
" inoremap <S-Down>  <C-o>4<C-e>
" inoremap <S-Up>    <C-o>4<C-y>
" inoremap <S-Right> <C-o>4zl


" [Ctrl + Arrow] to navigate windows (drop <C-\><C-n> if using vim)
tnoremap <C-Left>  <C-\><C-n><C-w>h
tnoremap <C-Down>  <C-\><C-n><C-w>j
tnoremap <C-Up>    <C-\><C-n><C-w>k
tnoremap <C-Right> <C-\><C-n><C-w>l
" inoremap <C-Left>  <C-w>h
" inoremap <C-Down>  <C-w>j
" inoremap <C-Up>    <C-w>k
" inoremap <C-Right> <C-w>l
nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l
vnoremap <C-Left>  <C-w>h
vnoremap <C-Down>  <C-w>j
vnoremap <C-Up>    <C-w>k
vnoremap <C-Right> <C-w>l

" [Alt + Arrow] : resize splits (drop <C-\><C-n> if using vim)
tnoremap <A-Left>  <C-\><C-N><C-w>8<
tnoremap <A-Down>  <C-\><C-N><C-w>8-
tnoremap <A-Up>    <C-\><C-N><C-w>8+
tnoremap <A-Right> <C-\><C-N><C-w>8>
" inoremap <A-Left>  <C-w>8<
" inoremap <A-Down>  <C-w>8-
" inoremap <A-Up>    <C-w>8+
" inoremap <A-Right> <C-w>8>
nnoremap <A-Left>  <C-w>8<
nnoremap <A-Down>  <C-w>8-
nnoremap <A-Up>    <C-w>8+
nnoremap <A-Right> <C-w>8>
vnoremap <A-Left>  <C-w>8<
vnoremap <A-Down>  <C-w>8-
vnoremap <A-Up>    <C-w>8+
vnoremap <A-Right> <C-w>8>

" [Ctrl + Alt + Arrow] Move splits (drop <C-\><C-n> if using vim)
tnoremap <C-A-Left>  <C-\><C-N><C-w>H
tnoremap <C-A-Down>  <C-\><C-N><C-w>J
tnoremap <C-A-Up>    <C-\><C-N><C-w>K
tnoremap <C-A-Right> <C-\><C-N><C-w>L
" inoremap <C-A-Left>  <C-w>H
" inoremap <C-A-Down>  <C-w>J
" inoremap <C-A-Up>    <C-w>K
" inoremap <C-A-Right> <C-w>L
nnoremap <C-A-Left>  <C-w>H
nnoremap <C-A-Down>  <C-w>J
nnoremap <C-A-Up>    <C-w>K
nnoremap <C-A-Right> <C-w>L
vnoremap <C-A-Left>  <C-w>H
vnoremap <C-A-Down>  <C-w>J
vnoremap <C-A-Up>    <C-w>K
vnoremap <C-A-Right> <C-w>L

" -----------------------------------------------------------------------------
" " OLD MAPPINGS
" " Parity with prev/next cmd in bash
" cmap <C-p> <Up>
" cmap <C-n> <Down>
" " L-s, L-w : Open search and replace command (with word under cursor)
" nnoremap <Leader>w :%s/<C-r><C-w>//g<Left><Left>
" nnoremap <Leader>s :%s//g<Left><Left>
" vnoremap <Leader>s :s//g<Left><Left>
