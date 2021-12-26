
command TextEdit :call TextEdit()

" Typos
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang> <args>
command! -bang WA wa<bang> <args>
command! -bang WA wa<bang> <args>
command! -bang Q q<bang> <args>
command! -bang Qa qa<bang> <args>
command! -bang QA qa<bang> <args>
