command! ToggleQL :call functions#ToggleQuickFix()
command! ToggleLL :call functions#ToggleLocation()
command! ToggleInsertTarget :call functions#ToggleInsertTarget()
command! DebugSyntax :call functions#DebugSyntax()

command! -nargs=* Cexpr cexpr system(expand(<q-args>))
command! -nargs=* Fd cexpr system('fd ' . expand(<q-args>))
command! -nargs=* Find cexpr system('fd ' . expand(<q-args>))
command! -nargs=* -complete=file_in_path Grep cexpr system(&grepprg . ' ' . expand(<q-args>))

command! -nargs=* Note exec '<mods> silent split ' . functions#StartNote(<q-args>) | exec 'lcd ' . expand("%:p:h") | echo expand("%:p")
command! -nargs=* Notes exec '<mods> silent split ~/Workspace/repos/field-notes/notes' | exec 'silent lcd ' . expand("%:p:h")

let s:stub = "open 'https://devdocs.io/#q="
command! -bang -nargs=* DD silent! call system(len(split(<q-args>, ' ')) == 0 ?
            \ s:stub . (expand('<bang>') == "!" || &filetype . '%20') . expand('<cword>') . "'" : len(split(<q-args>, ' ')) == 1 ?
            \ s:stub . (expand('<bang>') == "!" || &filetype . '%20') . <q-args> . "'" : s:stub . substitute(<q-args>, '\s\+', '%20', 'g') . "'")
