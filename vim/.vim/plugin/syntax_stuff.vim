function! s:DebugSyntax()
  let s = synID(line('.'), col('.'), 1)
  echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
endfunction

command! DebugSyntax :call s:DebugSyntax()

augroup speed_up_syntax
  autocmd!
  autocmd BufWinEnter,Syntax * syn sync minlines=1000 maxlines=1000
augroup END
