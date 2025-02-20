augroup base
  autocmd!
  " autocmd VimResized * wincmd =
  autocmd BufWritePre,FileWritePre * call functions#CreateDirs()
  autocmd FileType help,man,git,ale-info,fugitive,netrw call functions#SetInfoBufferOpts()
augroup END

augroup jump_to_last_change_on_open
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "norm! g'\"" | endif
augroup END

augroup spaces_and_tabs_on_save
  autocmd!
  autocmd BufWritePre * if index(['make'], &ft) < 0 | retab | endif
  autocmd BufWritePre * call functions#TrimSpaces()
augroup END

augroup speed_up_syntax
  autocmd!
  autocmd BufWinEnter,Syntax * syn sync minlines=1000 maxlines=1000
augroup END

" augroup speed_up_syntax
"   autocmd!
"   autocmd BufReadPre * call exec 'setl listchars+=multispace:'.repeat('-', getbufvar('%', "&shiftwidth") - 1).'+'
" augroup END
