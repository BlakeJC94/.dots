BASE = {
    -- Toggle quickfix lists
    ToggleCL=[[exec empty(filter(getwininfo(), 'v:val.quickfix')) ? "copen" : "cclose"]],
    ToggleLL=[[exec empty(filter(getwininfo(), 'v:val.loclist')) ? "lopen" : "lclose"]],
    -- Edit settings
    Settings=[[edit $MYVIMRC | lcd %:p:h]],
    -- Trim trailing spaces without upsetting changelist
    TrimSpaces=[[let g:tmp = winsaveview() | keeppatterns %s/\s\+$//e | call winrestview(g:tmp)]],
    -- Debug syntax highlights
    Syn=[[call v:lua.require("utils").show_syntax_group()]],
    -- Open notes buffer
    Notes=[[split ~/Dropbox/Journals | silent lcd %:p:h]],
    Note={nargs='?', cmd="call v:lua.require('utils').new_note(<f-args>)"},
}

return BASE

