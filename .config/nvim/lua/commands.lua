
CUSTOM_COMMANDS = {
    -- Toggle quickfix lists
    ToggleCL=[[exec empty(filter(getwininfo(), 'v:val.quickfix')) ? "copen" : "cclose"]],
    ToggleLL=[[exec empty(filter(getwininfo(), 'v:val.loclist')) ? "lopen" : "lclose"]],
    -- Trim trailing spaces without upsetting changelist
    TrimSpaces=[[let g:tmp = winsaveview() | keeppatterns %s/\s\+$//e | call winrestview(g:tmp)]],
    -- Textedit toggle
    Prose=[[setl wrap list colorcolumn=0 fo-=t]],
    UnProse=[[setl nowrap nolist colorcolumn=80]]
}
TYPO_COMMANDS = {
    E = {bang=true, nargs='*', complete='file', cmd=[[e<bang> <args>]]},
    W = {bang=true, nargs='*', complete='file', cmd=[[w<bang> <args>]]},
    Wq = {bang=true, nargs='*', complete='file', cmd=[[wq<bang> <args>]]},
    WQ = {bang=true, nargs='*', complete='file', cmd=[[wq<bang> <args>]]},
    Wa = {bang=true, cmd=[[wa<bang> <args>]]},
    WA = {bang=true, cmd=[[wa<bang> <args>]]},
    Q = {bang=true, cmd=[[q<bang>]]},
    Qa = {bang=true, cmd=[[qa<bang>]]},
    QA = {bang=true, cmd=[[qa<bang>]]},
}
ABBREVS = {
    ['c'] = {
        -- Terminal command shortcuts
        ['term']  = [[<C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'ToggleTerm direction=horizontal' : 'term')<CR>]],
        ['vterm'] = [[<C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'ToggleTerm direction=vertical' : 'vterm')<CR>]],
        -- File directory
        ['fd'] = [[%:p:h]],
        -- Force sudo save
        ['w!!'] = [[<C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'w sudo tee > /dev/null %<CR>' : 'w!!')]],
    }
}

M = {}

M.load_commands = function()
    for _, commands in ipairs({CUSTOM_COMMANDS, TYPO_COMMANDS}) do
        require("utils").apply_commands(commands)
    end
end

M.load_abbrevs = function()
    require("utils").apply_abbrevs(ABBREVS)
end

return M
