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


function! functions#SetInfoBufferOpts()
  setl colorcolumn=
  setl nospell
  setl foldlevel=99
  setl fo-=t
  nnoremap <buffer> K :h <C-r>=expand('<cword>')<CR><CR>
endfunction

function! functions#SetScratchBuffer() abort
  setl bufhidden=delete
  setl buftype=nofile
  setl nomodifiable
  " TODO Set buffer name as commit hash?
endfun

function! functions#DebugSyntax()
  let s = synID(line('.'), col('.'), 1)
  echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
endfunction

function! functions#VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction


" Settings that need to be set before running plugins
function! functions#setPreVars()
  let g:ale_disable_lsp = 1
  let g:ale_completion_enabled = 1
  let g:ale_hover_cursor = 0
  let g:polyglot_disabled = ['markdown']
endfunction


function! functions#BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endfunction
