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
vnoremap p P
vnoremap P p
" C-s : Quickly guess correct spelling errors (undoable)
inoremap <C-s> <C-g>u<Esc>[s1z=`]a<C-g>u
nnoremap <C-s> i<C-g>u<Esc>[s1z=`]
" Stop accidentally opening help in insert mode
inoremap <F1> <nop>
" Use unused arrow keys
nnoremap <Left> [
nnoremap <Right> ]
nnoremap <Up> [
nnoremap <Down> ]
" Fkey maps
nnoremap <F1> <cmd>setl relativenumber!<CR><cmd>setl relativenumber?<CR>
nnoremap <F2> <cmd>setl number!<CR><cmd>setl number?<CR>
nnoremap <F3> <cmd>setl wrap!<CR><cmd>setl wrap?<CR>
nnoremap <F4> <cmd>setl spell!<CR><cmd>setl spell?<CR>
nnoremap <F6> <cmd>wincmd =<CR>
" Resize split maps
nnoremap <C-Left>  <cmd>wincmd 8<<CR>
nnoremap <C-Up>    <cmd>wincmd 4+<CR>
nnoremap <C-Down>  <cmd>wincmd 4-<CR>
nnoremap <C-Right> <cmd>wincmd 8><CR>
" Vim Tab controls
nnoremap <Leader>t <cmd>tabedit %<CR>
nnoremap <Leader>n <cmd>tabnext<CR>
nnoremap <Leader>p <cmd>tabnext<CR>
nnoremap <Leader>N <cmd>+tabmove<CR>
nnoremap <Leader>P <cmd>-tabmove<CR>
" Vim arglist commands
nnoremap <Leader>aa <cmd>argument <bar> args<CR>
nnoremap <Leader>ax <cmd>argdelete <bar> args<CR>
nnoremap <Leader>as <cmd>argadd <bar> args<CR>

"" LEADER MAPS
nnoremap <Leader><CR> <cmd>Ex %:p:h<CR>
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>q <cmd>call functions#ToggleQuickFix()<CR>
nnoremap <Leader>l <cmd>exec functions#ToggleLocation()<CR>
nnoremap <Leader>; <cmd>edit $MYVIMRC <bar> lcd %:p:h<CR>
nnoremap <Leader>m <cmd>make -k %:p:t:r<CR>
