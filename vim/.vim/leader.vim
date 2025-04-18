let mapleader = "\<Space>"

" Fd
nnoremap <special> <Leader><CR> :Fd ''<Left>

" Windows and dirs
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>. <cmd>lcd %:p:h \| echo 'Changed local dir to ' . getcwd()<CR>
nnoremap <Leader>, <cmd>cd %:p:h \| echo 'Changed dir to ' . getcwd()<CR>
nnoremap <Leader>q <cmd>call functions#ToggleQuickFix()<CR>
nnoremap <Leader>l <cmd>exec functions#ToggleLocation()<CR>
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


