" A place for random ideas and trying new snippets

function! Foo()
  return 420
endfunction

function! ScratchMain()
  let val = Foo()
  return val
endfunction

command ScratchMain :call ScratchMain()
