command! ToggleQL :call functions#ToggleQuickFix()
command! ToggleLL :call functions#ToggleLocation()
command! ToggleInsertTarget :call functions#ToggleInsertTarget()
command! DebugSyntax :call functions#DebugSyntax()

command! -nargs=* Cexpr cexpr system(expand(<q-args>))
command! -nargs=* Fd cexpr system('fd ' . expand(<q-args>))
command! -nargs=* Find cexpr system('fd ' . expand(<q-args>))
command! -nargs=* -complete=file_in_path Grep cexpr system(&grepprg . ' ' . expand(<q-args>))

" command! -nargs=* -complete=file_in_path Open silent! execute '!' . (system('uname') =~ "darwin" ? '' : 'xdg-') . 'open ' . shellescape(expand(len(<q-args>) ? <q-args> : '%:p'), 1) . ' > /dev/null 2>&1 &' | redraw!
" let g:loaded_openPlugin = 1  " TODO Check that vim9 :Open works as expected

command! -nargs=? Ipy exec 'botright <mods> ' . functions#StartupIpythonCmd("<args>")
command! -bang PyScrap exec '<mods> ' . (<bang>0 ? 'edit' : 'split') . ' ' . getcwd() . '/scrap/scratch.py'



