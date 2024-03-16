
let g:netrw_bufsettings = 'number relativenumber'  " numbers in netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 0

" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25

let g:netrw_altfile = 1  " Whether <C-^> should jump to the last edited file

augroup fix_netrw_noscratch_buffer_bug
  autocmd!
  " autocmd BufWritePost * if index(['netrw'], &ft) == 0 | setl buftype=nofile bufhidden=hide | endif
  " autocmd FileType netrw setl buftype=nofile bufhidden=hide
  autocmd BufWinEnter * if &ft == 'netrw' | set buftype=nofile bufhidden=hide | endif
augroup END
