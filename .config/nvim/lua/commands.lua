CUSTOM_COMMANDS = {
    -- Toggle quickfix lists
    ToggleCL=[[exec empty(filter(getwininfo(), 'v:val.quickfix')) ? "copen" : "cclose"]],
    ToggleLL=[[exec empty(filter(getwininfo(), 'v:val.loclist')) ? "lopen" : "lclose"]],
    -- Trim trailing spaces without upsetting changelist
    TrimSpaces=[[let g:tmp = winsaveview() | keeppatterns %s/\s\+$//e | call winrestview(g:tmp)]],
    -- Textedit toggle
    Prose=[[setl wrap colorcolumn=0 fo-=t]],
    UnProse=[[setl nowrap colorcolumn=100,101]],
    -- Open notes buffer
    Notes=[[call v:lua.require('utils').open_notes()]]
}
LSP_COMMANDS = {
    LspReferences=[[lua vim.lsp.buf.references()]],
    LspSignature=[[lua vim.lsp.buf.signature_help()]],
    LspCodeAction=[[lua vim.lsp.buf.code_action()]],
    LspFormat=[[lua vim.lsp.buf.formatting()]],
    LspLineDiagnostics=[[lua vim.lsp.diagnostic.show_line_diagnostics()]],
    LspIncomingCalls=[[lua vim.lsp.buf.incoming_calls()]],
    LspOutgoingCalls=[[lua vim.lsp.buf.outgoing_calls()]],
    LspListWorkspaceFolders=[[lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))]],
    LspDocumentSymbol=[[lua vim.lsp.buf.document_symbol()]],
    LspDefinition=[[lua vim.lsp.buf.definition()]],
    LspTypeDefinition=[[lua vim.lsp.buf.type_definition()]],
    LspDeclaration=[[lua vim.lsp.buf.declaration()]],
    LspImplementation=[[lua vim.lsp.buf.implementation()]],
    LspRename={nargs='?', cmd=[[lua vim.lsp.buf.rename(<f-args>)]]},
    LspWorkspaceSymbol={nargs='?', cmd=[[lua vim.lsp.buf.workspace_symbol(<f-args>)]]},
    LspAddWorkspaceFolder={nargs='?', complete='dir', cmd=[[lua vim.lsp.buf.add_workspace_folder(<f-args>)]]},
    LspRemoveWorkspaceFolder={nargs='?', complete='dir', cmd=[[lua vim.lsp.buf.remove_workspace_folder(<f-args>)]]},
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

M.apply_commands = function(commands)
    -- TODO docs
    for name, val in pairs(commands) do
        if (type(val) == "table") then
            local cmd_str = {'command!'}
            if val.bang == true then
                table.insert(cmd_str, '-bang')
            end
            if val.nargs then
                table.insert(cmd_str, '-nargs=' .. val.nargs)
            end
            if val.complete then
                table.insert(cmd_str, '-complete=' .. val.complete)
            end
            table.insert(cmd_str, name)
            table.insert(cmd_str, val.cmd)
            cmd_str = table.concat(cmd_str, ' ')
            vim.cmd(cmd_str)
        else
            local cmd_str = table.concat({'command!', name, val}, ' ')
            vim.cmd(cmd_str)
        end
    end
end

M.load_commands = function()
    for _, commands in ipairs({CUSTOM_COMMANDS, TYPO_COMMANDS}) do
        require("commands").apply_commands(commands)
    end
end

M.apply_abbrevs = function(abbrevs)
    -- TODO docs
    for mode, abbreviations in pairs(abbrevs) do
        for lhs, rhs in pairs(abbreviations) do
            local cmd_str = mode .. 'noreabbrev' .. ' ' .. lhs .. ' ' .. rhs
            vim.cmd(cmd_str)
        end
    end
end

M.load_abbrevs = function()
    require("commands").apply_abbrevs(ABBREVS)
end

return M
