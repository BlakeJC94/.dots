augroup base
  autocmd!
  autocmd VimResized * wincmd =
  autocmd BufWritePre * retab
  autocmd BufWritePre * call functions#TrimSpaces()
  autocmd BufWritePre,FileWritePre * call functions#CreateDirs()
  autocmd InsertEnter,InsertLeave * call functions#ToggleInsertTarget()
  autocmd FileType help,man call functions#SetInfoBufferOpts()
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "norm! g'\"" | endif
augroup END

augroup speed_up_syntax
  autocmd!
  autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END
