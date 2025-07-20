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
    call mkdir(dir, 'p')
  endif
endfunction

function! functions#ToggleInsertTarget()
  let cols_str = string(&textwidth+1) . ',' . string(&textwidth+2)
  execute 'setl colorcolumn=' . ((&colorcolumn == "" && &fo =~ 't') ? cols_str : "")
  execute 'setl ' . (&cursorline == 0 ? "cursorline" : "nocursorline")
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

nnoremap <silent> gs :set opfunc=functions#Sort<CR>g@
vnoremap <silent> gs :<C-u>call functions#Sort('vis')<CR>
function! functions#Sort(type, ...)
    let marks = a:type ==? 'vis' ? '<>' : '[]'
    let [_, l1, c1, _] = getpos("'" . marks[0])
    let [_, l2, c2, _] = getpos("'" . marks[1])
    execute l1 . ',' . l2 . 'sort'
endfunction

" Reverse lines, selected or over motion.
nnoremap <silent> gr :set opfunc=functions#ReverseLines<CR>g@
vnoremap <silent> gr :<C-u>call functions#ReverseLines('vis')<CR>
function! functions#ReverseLines(type) abort
    let marks = a:type ==? 'vis' ? '<>' : '[]'
    let [_, l1, c1, _] = getpos("'" . marks[0])
    let [_, l2, c2, _] = getpos("'" . marks[1])
    if l1 == l2
        return
    endif
    for line in getline(l1, l2)
        call setline(l2, line)
        let l2 -= 1
    endfor
endfunction
