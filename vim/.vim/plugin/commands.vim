command! ToggleQL :call functions#ToggleQuickFix()
command! ToggleLL :call functions#ToggleLocation()
command! ToggleInsertTarget :call functions#ToggleInsertTarget()
command! DebugSyntax :call functions#DebugSyntax()

command! -nargs=* Cexpr cexpr system(expand(<q-args>))
command! -nargs=* Fd cexpr system('fd ' . expand(<q-args>))
command! -nargs=* Find cexpr system('fd ' . expand(<q-args>))
command! -nargs=* -complete=file_in_path Grep cexpr system(&grepprg . ' ' . expand(<q-args>))

command! -nargs=* -bang Note exec '<mods> silent ' . (<bang>0 ? 'edit' : 'split') . ' ' . functions#StartNote(<q-args>) | call functions#InitializeNoteIfNeeded(<q-args>) | exec 'lcd ' . expand("%:p:h") | echo expand("%:p")
command! -nargs=* -bang Notes exec'<mods> silent ' . (<bang>0 ? 'edit' : 'split') . ' ' . g:field_notes_dir | exec 'silent lcd ' . expand("%:p:h")
command! -nargs=* Today exec 'Note ' . strftime("%Y-%m-%d")
command! -nargs=* Diagram !open https://asciiflow.com/
