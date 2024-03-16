" A place for random ideas and trying new snippets

function! Foo()
  return 420
endfunction


function! Bar() abort
  " TODO Try get name from input arg
  " TODO Try infer name of file from git/branch
  " TODO Fallback name of file from dir
  " TODO Slugify name of file
  " TODO Open split buffer
  " TODO If new file, Add name of file as title

  redraw
  let l:dir = input('Enter name of directory : '.g:journal_location.'/')
  redraw
  let l:name = input('Enter heading of file : ')
  let l:name = substitute(l:name, '\w', '\U&', '')
  redraw

  let l:file_name = substitute(tolower(l:name), ' ', '_', "g") . '.md'
  let l:file_dir = g:journal_location . '/' . l:dir
  let l:file_path = l:file_dir  . '/' . l:file_name


  sleep 500m
  " create file and write heading
  let l:heading = substitute(l:name, '^', '# ', '')
  let l:heading = substitute(l:name, '$', '\n\n', '')
  if !isdirectory(expand(l:file_dir))
    call mkdir(expand(l:file_dir))
    echo "Created new dir : ".l:dir
  endif
  if !filereadable(expand(l:file_path))
    call writefile(split(l:heading, '\n', 1), expand(l:file_path))
    echo "Created new file : ".l:file_path
  endif

  " save current file and open target
  try
    write
  endtry
  exec 'edit '. expand(l:file_path)
  norm! G
endfunction
" call JournalNewFile()

function! ScratchMain()
  " let val = Foo()
  " echo val
  Bar()
endfunction

command ScratchMain :call ScratchMain()
