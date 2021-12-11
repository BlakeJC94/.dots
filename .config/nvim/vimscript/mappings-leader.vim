let mapleader = "\<Space>"
d  
"
" L-q to quit
noremap <Leader>q :q<CR>
" L-d : Change directory of vim to current file
noremap <Leader>d :cd %:p:h<CR>:pwd<CR>
" L-s : toggle highlights on search
noremap <Leader>s :set hls!<CR>
" L-m : Mark file for harpoon
noremap <Leader>m :lua require("harpoon.mark").add_file()<CR>
"
" L-<BS> : Fuzzy finder
noremap <Leader><BS> :Telescope find_files<CR>
" L-<CR> : File explorer
noremap <Leader><CR> :lua require'lir.float'.toggle()<CR>
" L-<Tab> : Switch between last opened files
noremap <Leader><Tab> <C-^>
" L-<Esc> : Toggle Harpoon
noremap <Leader><Esc> :lua require("harpoon.ui").toggle_quick_menu()<CR>

" L-c : Toggle qflist
nnoremap <Leader>c :call ToggleQuickFix()<CR>
" L-l : Toggle loclist
nnoremap <Leader>l :call ToggleLocation()<CR>

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
