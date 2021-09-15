
let mapleader = "\<Space>"

" L-q to quit
noremap <Leader>q :q<CR>

" L-d : Change directory of vim to current file
noremap <Leader>d :cd %:p:h<CR>:pwd<CR>
" L-<CR> : File explorer
noremap <Leader><CR> :e %:p:h<CR>

" L-h,l : open/close loclist
nnoremap <Leader>l :call ToggleLocation()<CR>
" L-j,k : Navigate loclist
nnoremap <Leader>j :lnext<CR>
nnoremap <Leader>k :lprev<CR>

" L-<BS> : Switch between last opened files
noremap <Leader><BS> <C-^>

" L-<Tab> : toggle highlights on search
noremap <Leader><Tab> :set hls!<CR>

" L-. Toggle spellcheck
nnoremap <Leader>. :set spell!<CR>
" L-;, L-, : Jump between spelling mistakes
nnoremap <Leader>; ]s
nnoremap <Leader>, [s

" -----------------------------------------------------------------------------
" " VIM TERMINAL MAPPINGS
" " Use Alt + ; to go to normal mode
" tnoremap <A-:> <C-w><S-n>
" " Use Alt + Shift + ; to go to command mode
" tnoremap <A-:> <C-w><S-n>:
" cnoreabbrev vterm vert term
" -----------------------------------------------------------------------------
" " OLD MAPPINGS
" " Parity with prev/next cmd in bash
" cmap <C-p> <Up>
" cmap <C-n> <Down>
" " L-s, L-w : Open search and replace command (with word under cursor)
" nnoremap <Leader>w :%s/<C-r><C-w>//g<Left><Left>
" nnoremap <Leader>s :%s//g<Left><Left>
" vnoremap <Leader>s :s//g<Left><Left>
