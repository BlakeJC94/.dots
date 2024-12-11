inoreabbrev <buffer> BB BREAKING CHANGE:
nnoremap    <silent> <buffer> <CR>  i<C-r>=<sid>commit_type()<CR>

fun! s:commit_type()
  if !(line('.') ==# 1 && col('.') ==# 1)
    return ''
  endif
  let l:commit_msg = ''

  " Get the user's choice from the type confirm dialog
  let l:type_options = ["&1 fix", "&2 feat", "&3 docs", "&4 style", "&5 refactor", "&6 perf", "&7 test", "&8 build", "&9 ci"]
  let l:type_choice = confirm('Choose commit type (<CR> to skip) ', join(l:type_options, "\n"), 0)
  " Check if a valid choice was made (non-zero index)
  if l:type_choice != 0
    " Return the selected commit type
    let l:commit_msg = l:commit_msg . strpart(l:type_options[l:type_choice - 1], 3)
  else
    return ''
  endif

  " Get the user's input from the scope dialog
  let l:scope = input('Add scope: ', "")
  " Check if a valid choice was made (non-zero index)
  if l:scope != ""
    " Return the selected commit type
    let l:commit_msg = l:commit_msg . '(' . l:scope . ')'
  endif

  " Get the user's choice from the breaking change confirm dialog
  let l:break_options = ["&Yes", "&No"]
  let l:break_choice = confirm('Breaking change?', join(l:break_options, "\n"), &ic ? 0 : 4)
  " Check if a valid choice was made (non-zero index)
  if l:break_choice == 1
    let l:commit_msg = l:commit_msg . '!'
  endif

  let l:commit_msg = l:commit_msg . ': '
  return l:commit_msg
endfun
