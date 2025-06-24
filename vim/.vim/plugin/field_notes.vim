command! -nargs=* -bang Note exec '<mods> silent ' . (<bang>0 ? 'edit' : 'split') . ' ' . field_notes#StartNote(<q-args>) | call field_notes#InitializeNoteIfNeeded(<q-args>) | exec 'lcd ' . expand("%:p:h") | echo expand("%:p")
command! -nargs=* -bang Notes exec'<mods> silent ' . (<bang>0 ? 'edit' : 'split') . ' ' . g:field_notes_dir | exec 'silent lcd ' . expand("%:p:h")
command! -nargs=1 -bang Journal exec '<mods> Note<bang> ' . strftime("%Y-%m-%d", localtime() + (<args> * 86400))
command! -bang Today exec '<mods> Journal<bang> 0'
command! -bang Tomorrow exec '<mods> Journal<bang> 1'
command! -bang Yesterday exec '<mods> Journal<bang> -1'
command! -bang NextWeek exec '<mods> Journal<bang> 7'
command! -bang LastWeek exec '<mods> Journal<bang> -7'
command! -bang NextMonday exec '<mods> Journal<bang> ' . ((8 - strftime('%w') + 0) % 7)
command! -bang LastMonday exec '<mods> Journal<bang> ' . (- ((strftime('%w') - 1 + 7) % 7))
command! -bang NextFriday exec '<mods> Journal<bang> ' . ((5 - strftime('%w') + 7) % 7)
command! -bang LastFriday exec '<mods> Journal<bang> ' . (- ((strftime('%w') - 5 + 7) % 7))
" command! -nargs=* Diagram !open https://asciiflow.com/
" command! -nargs=* Diagram call field_notes#NewDiagram(<q-args>)
" command! -nargs=* Image call field_notes#MoveImage(<q-args>)



