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

function! functions#Slugify(string)
  let output = a:string
  let output = tolower(output)
  let output = substitute(output, '\W\+', '_', 'g')
  let output = substitute(output, '^_\+', '', 'g')
  let output = substitute(output, '_\+$', '', 'g')
  return output
endfunction

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


function! functions#GetGitDir()
  if len(system("command -v git")) == 0
    return ""
  endif
  let l:git_dir = split(system(join(["git", "-C", expand("%:p:h"),  "rev-parse",  "--git-dir"], " ")), '\n')[0]
  if l:git_dir[0:5] == "fatal:"
    return ""
  endif
  return l:git_dir
endfunction

" Settings that need to be set before running plugins
function! functions#setPreVars()
  let g:ale_disable_lsp = 1
  let g:ale_completion_enabled = 1
  let g:ale_hover_cursor = 0
  let g:polyglot_disabled = ['markdown']
endfunction

let g:field_notes_dir = "~/Workspace/repos/field-notes/notes"

function! functions#StartNote(...) abort
  let l:title = join(a:000, " ")

  if len(l:title) == 0
    let l:git_dir = functions#GetGitDir()
    if len(l:git_dir) > 0
      " Branch
      let l:project_path = finddir('.git/..', expand('%:p:h') . ';')
      let l:project_name = split(l:project_path, '/')[-1]
      let l:branch_name = split(system(join(["git", "-C", expand("%:p:h"), "branch", "--show-current", "--quiet"], " ")), '\n')[0]
    else
      " Dir
      let l:project_parent_dirs = split(getcwd(), '/')
      let l:project_name = l:project_parent_dirs[-2]
      let l:branch_name = l:project_parent_dirs[-1]
    endif
    let l:project_name = substitute(l:project_name, '^\.\+', '', 'g')
    let l:branch_name = substitute(l:branch_name, '^\.\+', '', 'g')
    let l:title = join([l:project_name, l:branch_name], ": ")
  endif

  let l:filename = functions#Slugify(l:title) . ".md"
  let l:filepath = join([g:field_notes_dir, l:filename], '/')

  let l:heading = substitute(l:title, '^', '# ', '')
  let l:heading = substitute(l:heading, '$', '\n\n', '')

  if !filereadable(expand(l:filepath))
    call writefile(split(l:heading, '\n', 1), expand(l:filepath))
    echo join(["Created new file", l:filepath], " : ")
  endif

  return l:filepath
endfunction


function! functions#BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endfunction

function! functions#Sort(type, ...)
    '[,']sort
endfunction


function! functions#RandomVimdirTip()
  let l:pat = '\">\\s*'
  let l:result = []

  let l:filepaths = [expand("$MYVIMRC")]
  for globpat in [ '$MYVIMDIR/*.vim', '$MYVIMDIR/plugin/**/*.vim', '$MYVIMDIR/ftplugin/**/*.vim', '$MYVIMDIR/after/**/*.vim']
    let l:filepaths = l:filepaths + glob(globpat, 1, 1)
  endfor

  for filepath in l:filepaths
    if filereadable(filepath)
      let l:lines = readfile(filepath)
      let l:result = l:result + map(filter(l:lines, 'v:val =~# "' . l:pat . '"'), 'substitute(v:val, "^.*' . l:pat . '", "", "")')
    endif
  endfor

  if empty(l:result)
    return ''
  endif

  let l:random_index = rand() % (len(l:result))
  return l:result[l:random_index]
endfunction
