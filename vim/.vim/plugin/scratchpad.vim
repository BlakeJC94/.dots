" A place for random ideas and trying new snippets
function! BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endfunction

nnoremap J gJ
nnoremap gJ :<C-u>call BreakHere()<CR>

function! Sort(type, ...)
    '[,']sort
endfunction
nmap <silent> gS :set opfunc=Sort<CR>g@
vmap <silent> gS :sort<CR>

" Build the URL stub
let s:stub = "open 'https://devdocs.io/#q="

" Build the command
command! -bang -nargs=* DD silent! call system(len(split(<q-args>, ' ')) == 0 ?
            \ s:stub . (expand('<bang>') == "!" || &filetype . '%20') . expand('<cword>') . "'" : len(split(<q-args>, ' ')) == 1 ?
            \ s:stub . (expand('<bang>') == "!" || &filetype . '%20') . <q-args> . "'" : s:stub . substitute(<q-args>, '\s\+', '%20', 'g') . "'")


function! Foo()
  return 420
endfunction

command! -bar -nargs=* Jump cexpr system('git jump --stdout ' . expand(<q-args>))

function! ScratchMain()
  let val = Foo()
  echo val
endfunction

command ScratchMain :call ScratchMain()
