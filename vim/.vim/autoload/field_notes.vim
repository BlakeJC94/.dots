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

" AIDEV-NOTE: Moves image to structured img directory and inserts markdown reference
function! field_notes#MoveImage(...)
  if a:0 == 0
    echo "Error: Target image path required"
    return
  endif

  let l:target_image_path = expand(a:1)

  " Check if target image exists
  if !filereadable(l:target_image_path)
    echo "Error: Target image file does not exist: " . l:target_image_path
    return
  endif

  " Split target image path into components
  let l:target_parent = fnamemodify(l:target_image_path, ':h')
  let l:target_stem = fnamemodify(l:target_image_path, ':t:r')
  let l:target_ext = fnamemodify(l:target_image_path, ':e')

  " Split current filepath into components
  let l:dest_parent = expand('%:p:h')
  let l:dest_stem = expand('%:t:r')
  let l:dest_ext = expand('%:e')

  " Create destination directory structure
  let l:img_subdir = field_notes#Slugify(l:dest_stem)
  let l:dest_dir = join([l:dest_parent, 'img', l:img_subdir], '/')

  " Create directory if it doesn't exist
  if !isdirectory(l:dest_dir)
    call mkdir(l:dest_dir, 'p')
  endif

  " Create destination file path
  let l:slugified_target_stem = field_notes#Slugify(l:target_stem)
  let l:dest_filename = l:slugified_target_stem . '.' . l:target_ext
  let l:dest_path = join([l:dest_dir, l:dest_filename], '/')

  " Copy the image file
  let l:copy_cmd = 'cp "' . l:target_image_path . '" "' . l:dest_path . '"'
  let l:result = system(l:copy_cmd)
  if v:shell_error != 0
    echo "Error copying file: " . l:result
    return
  endif

  " Create relative path for markdown
  let l:relative_path = join(['./img', l:img_subdir, l:dest_filename], '/')

  " Insert markdown image reference below current line
  let l:markdown_text = '![' . l:target_stem . '](' . l:relative_path . ')'
  call append(line('.'), l:markdown_text)

  echo "Image moved to: " . l:dest_path
endfunction

" Installing Write on Linux:
" ```
" wget https://www.styluslabs.com/download/write-tgz
" mkdir -p ~/.local/opt`
" mv write-latest.tar.gz ~/.local/opt`
" cd ~/.local/opt
" tar xzfv write-latest.tar.gz
" cd Write
" sudo ./setup.sh
" xdg-mime default Write.desktop image/svg+xml
" ```

" Installing Write on MacOS
" ```
" brew install write
" brew install duti
" duti -s $(osascript -e 'id of app "Write"') .svg all
" duti -s $(osascript -e 'id of app "Write"') .svgz all
" ```

function! field_notes#NewDiagram(...)
  let l:title = join(a:000, " ")

  if len(l:title) == 0
    let l:title = strftime("%Y_%m_%d_%H%M")
  endif

  " Split current filepath into components
  let l:dest_parent = expand('%:p:h')
  let l:dest_stem = expand('%:t:r')
  let l:dest_ext = expand('%:e')

  " Create destination directory structure
  let l:img_subdir = field_notes#Slugify(l:dest_stem)
  let l:dest_dir = join([l:dest_parent, 'img', l:img_subdir], '/')
  let l:dest_filename = field_notes#Slugify(l:title). ".svg"
  let l:dest_path = join([l:dest_dir, l:dest_filename], '/')

  " Create directory if it doesn't exist
  if !isdirectory(l:dest_dir)
    call mkdir(l:dest_dir, 'p')
  endif

  " Make target image name: img_name=`expand('%:t:r') . '_' . slugify(diagram_name) .  '.ext'`
  let l:filename = field_notes#Slugify(l:title) . ".svg"

  " Get the template path
  let l:template_path = join([l:dest_parent, 'templates', "template.svg"], '/')

  " Copy the image file
  let l:copy_cmd = 'cp "' . l:template_path . '" "' . l:dest_path . '"'
  let l:result = system(l:copy_cmd)
  if v:shell_error != 0
    echo "Error copying file: " . l:result
    return
  endif

  " Create relative path for markdown
  let l:relative_path = join(['./img', l:img_subdir, l:dest_filename], '/')

  " Insert markdown image reference below current line
  let l:markdown_text = '![' . l:title . '](' . l:relative_path . ')'
  call append(line('.'), l:markdown_text)

  echo "Created new canvas at: " . l:dest_path
endfunction

" TODO
function! field_notes#BlogHeader(...)
  " ...
endfunction
