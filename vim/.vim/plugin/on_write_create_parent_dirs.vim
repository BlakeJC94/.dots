function! s:CreateDirs()
  let dir = expand('<afile>:p:h')
  if isdirectory(dir) == 0 && dir !~ ':'
    call mkdir(dir, 'p')
  endif
endfunction

augroup create_dirs_on_write
  autocmd!
  autocmd BufWritePre,FileWritePre * call s:CreateDirs()
augroup END
