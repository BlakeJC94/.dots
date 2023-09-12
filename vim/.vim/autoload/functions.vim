function! functions#MyFoldText()
  let line = getline(v:foldstart)
  let indent_str = repeat(' ', indent(v:foldstart - 1))
  let fold_str = indent_str . line . repeat(' ', &textwidth)
  let fold_size = v:foldend - v:foldstart + 1
  let fold_size_str = ' (' . fold_size . ') '
  return fold_str[0:&textwidth - len(fold_size_str)] . fold_size_str
endfunction

function! functions#ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
endfunction

function! functions#ToggleLocation()
    if empty(filter(getwininfo(), 'v:val.loclist'))
      try
        lopen
      catch /^Vim\%((\a\+)\)\=:E776:/
        echo 'No location list'
      endtry
    else
      lclose
    endif
endfunction

function! functions#TrimSpaces()
  let winstate = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(winstate)
endfunction

function! functions#CreateDirs()
  let dir = expand('<afile>:p:h')
  if isdirectory(dir) == 0 && dir !~ ':'
    mkdir(dir, 'p')
  endif
endfunction

function! functions#ToggleInsertTarget()
  let cols_str = string(&textwidth+1) . ',' . string(&textwidth+2)
  execute 'setl colorcolumn=' . (&colorcolumn == "" ? cols_str : "")
  execute 'setl ' . (&cursorline == 0 ? "cursorline" : "nocursorline")
endfunction

function! functions#SetInfoBufferOpts()
  setl colorcolumn=
  setl nospell
  setl foldlevel=99
  setl fo-=t
  nnoremap <buffer> K :h <C-r>=expand('<cword>')<CR><CR>
endfunction

function! functions#Slugify(string)
  let output = a:string
  let output = tolower(output)
  let output = substitute(output, '[ \[\]()\{\}\\-.,=\'\":;><`]+', '_', 'g')
  let output = substitute(output, '^[_]+', '', 'g')
  let output = substitute(output, '[_]+$', '', 'g')
  return output
endfunction
