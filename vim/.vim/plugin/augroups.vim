augroup base
  autocmd!
  autocmd VimResized * wincmd =
  autocmd BufWritePre * if index(['make'], &ft) < 0 | retab | endif
  autocmd BufWritePre * call functions#TrimSpaces()
  autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
  autocmd BufWritePre,FileWritePre * call functions#CreateDirs()
  " autocmd InsertEnter,InsertLeave * call functions#ToggleInsertTarget()
  autocmd FileType help,man,git,ale-info,fugitive call functions#SetInfoBufferOpts()
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "norm! g'\"" | endif
augroup END

augroup speed_up_syntax
  autocmd!
  autocmd BufWinEnter,Syntax * syn sync minlines=1000 maxlines=1000
augroup END
