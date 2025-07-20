" A place for random ideas and trying new snippets
function! s:Foo()
  return 420
endfunction

function! s:ScratchMain()
  let val = s:Foo()
  echo val
endfunction


" command ScratchMain :call s:ScratchMain()
