
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
inoremap <S-Left>  <C-o>4zh
inoremap <S-Down>  <C-o>4<C-e>
inoremap <S-Up>    <C-o>4<C-y>
inoremap <S-Right> <C-o>4zl


" [Ctrl + Arrow] to navigate windows (drop <C-\><C-n> if using vim)
tnoremap <C-Left>  <C-\><C-n><C-w>h
tnoremap <C-Down>  <C-\><C-n><C-w>j
tnoremap <C-Up>    <C-\><C-n><C-w>k
tnoremap <C-Right> <C-\><C-n><C-w>l
inoremap <C-Left>  <C-w>h
inoremap <C-Down>  <C-w>j
inoremap <C-Up>    <C-w>k
inoremap <C-Right> <C-w>l
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
inoremap <A-Left>  <C-w>8<
inoremap <A-Down>  <C-w>8-
inoremap <A-Up>    <C-w>8+
inoremap <A-Right> <C-w>8>
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
inoremap <C-A-Left>  <C-w>H
inoremap <C-A-Down>  <C-w>J
inoremap <C-A-Up>    <C-w>K
inoremap <C-A-Right> <C-w>L
nnoremap <C-A-Left>  <C-w>H
nnoremap <C-A-Down>  <C-w>J
nnoremap <C-A-Up>    <C-w>K
nnoremap <C-A-Right> <C-w>L
vnoremap <C-A-Left>  <C-w>H
vnoremap <C-A-Down>  <C-w>J
vnoremap <C-A-Up>    <C-w>K
vnoremap <C-A-Right> <C-w>L

