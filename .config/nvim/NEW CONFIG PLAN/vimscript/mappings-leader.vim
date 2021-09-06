
let mapleader = "\<Space>"

" L-q to quit
noremap <Leader>q :q<CR>

" L-d : Change directory of vim to current file
noremap <Leader>d :cd %:p:h<CR>:pwd<CR>
" L-e : File explorer
noremap <Leader>e :e %:p:h<CR>

" L-h,l : open/close loclist
nnoremap <Leader>h :lopen<CR>
nnoremap <Leader>l :lclose<CR>
" L-j,k : Navigate loclist
nnoremap <Leader>j :lnext<CR>
nnoremap <Leader>k :lprev<CR>

" " L-y, L-p : System clipboard
" nnoremap <Leader>y "+y
" nnoremap <Leader>Y "+Y
" vnoremap <Leader>y "+y
" vnoremap <Leader>Y "+Y
" nnoremap <Leader>p "+p
" vnoremap <Leader>p "+p

" L-<BS> : Switch between last opened files
noremap <Leader><BS> <C-^>

" L-<Tab> : toggle highlights on search
noremap <Leader><Tab> :set hls!<CR>


" " L-m : Toggle maximize current buffer
" nnoremap <silent><Leader>m :MaximizerToggle<CR>
" vnoremap <silent><Leader>m :MaximizerToggle<CR>gv
" 
" " ga : Easyalign visual selection (e.g. vipga*| to align around all | chars)
" xmap ga <Plug>(EasyAlign)
" nmap ga <Plug>(EasyAlign)
" 
" " <F4> : Limelight
" nmap <F4> :Limelight!!<CR>
" vmap <F4> :Limelight!!<CR>
" imap <F4> <C-o>:Limelight!!<CR>
" tmap <F4> <C-\><C-n>:Limelight!!<CR>i
" 
" " L-f : Goyo
" nmap <Leader>f :Goyo<CR>
" vmap <Leader>f :Goyo<CR>
" 
" " L-t : Telescope
" nnoremap <leader>tf <cmd>Telescope find_files<cr>
" " nnoremap <leader>tg <cmd>Telescope treesitter<cr>
" nnoremap <leader>tb <cmd>Telescope buffers<cr>
" nnoremap <leader>th <cmd>Telescope help_tags<cr>


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
