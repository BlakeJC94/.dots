" A place for random ideas and trying new snippets
function! Foo()
  return 420
endfunction

function! ScratchMain()
  let val = Foo()
  echo val
endfunction

autocmd Filetype markdown,liquid,text
            \ syn region markdownLink matchgroup=markdownLinkDelimiter
            \ start="(" end=")" keepend contained conceal contains=markdownUrl
" autocmd Filetype markdown,liquid,text
"             \ syn match markdownExt /{[.:#][^}]*}/ conceal contains=ALL

command ScratchMain :call ScratchMain()
