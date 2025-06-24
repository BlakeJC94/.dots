function! field_notes#Slugify(string)
  let output = a:string
  let output = tolower(output)
  let output = substitute(output, '\W\+', '_', 'g')
  let output = substitute(output, '^_\+', '', 'g')
  let output = substitute(output, '_\+$', '', 'g')
  return output
endfunction

function! field_notes#GetGitDir()
  if len(system("command -v git")) == 0
    return ""
  endif
  let l:git_dir = split(system(join(["git", "-C", expand("%:p:h"),  "rev-parse",  "--git-dir"], " ")), '\n')[0]
  if l:git_dir[0:5] == "fatal:"
    return ""
  endif
  return l:git_dir
endfunction

function! field_notes#GetNoteTitle(...)
  let l:title = join(a:000, " ")

  if len(l:title) == 0
    let l:git_dir = field_notes#GetGitDir()
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

  return l:title
endfunction

function! field_notes#StartNote(...) abort
  let l:title = call('field_notes#GetNoteTitle', a:000)
  let l:filename = field_notes#Slugify(l:title) . ".md"
  let l:filepath = join([g:field_notes_dir, l:filename], '/')
  return l:filepath
endfunction

function! field_notes#GetNoteHeading(...)
  let l:title = call('field_notes#GetNoteTitle', a:000)
  let l:heading = substitute(l:title, '^', '# ', '')
  let l:heading = substitute(l:heading, '$', '\n\n', '')
  return l:heading
endfunction

function! field_notes#InitializeNoteIfNeeded(...)
  if !filereadable(expand('%'))
    call setline(1, split(call('field_notes#GetNoteHeading', a:000), '\n', 1))
    set buftype=
    set nomodified
  endif
endfunction

