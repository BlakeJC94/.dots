local FUNCTIONS = require('functions')

return {
    Settings = function()
        vim.cmd('edit $MYVIMRC')
        vim.cmd('lcd %:p:h')
        print('Editing settings: ' .. vim.fn.expand('%:p'))
    end,
    NewSession = function()
        vim.cmd('bufdo bdel')
        vim.cmd('enew')
        print('[New session]')
    end,
    ChangeDir = function()
        vim.cmd('cd ' .. vim.fn.expand('%:p:h'))
        print('Changed directory to ' .. vim.fn.getcwd())
    end,
    ChangeLocalDir = function()
        vim.cmd('lcd ' .. vim.fn.expand('%:p:h'))
        print('Changed local diriectory to ' .. vim.fn.getcwd())
    end,
    NewFile = function()
        vim.cmd('enew')
        print('[New file]')
    end,
    ToggleQL = function()  -- Toggle display of quickfix list
        if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix') == 0 then
            vim.cmd('copen')
        else
            vim.cmd('cclose')
        end
    end,
    ToggleLL = function()  -- Toggle display of location list
        if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.loclist') == 0 then
            vim.cmd('lopen')
        else
            vim.cmd('lclose')
        end
    end,
    -- NOTES_CMDS
    Notes = function()  -- Open notes buffer
        vim.cmd('split')
        vim.cmd('lcd ~/Dropbox/Journals')
        vim.cmd('edit ~/Dropbox/Journals')
    end,
    Note = {
        function(keys)
            FUNCTIONS.NewNote(keys.args)
        end,
        {force=true, nargs='?'}
    },
    -- TYPO_CMDS
    E = {
        function(keys)
            local cmd = 'e'
            if keys.bang then cmd = cmd .. '!' end
            vim.cmd(cmd .. ' ' .. keys.args)
        end,
        {force=true, bang=true, nargs='*', complete='file'}
    },
    W = {
        function(keys)
            local cmd = 'w'
            if keys.bang then cmd = cmd .. '!' end
            vim.cmd(cmd .. ' ' .. keys.args)
        end,
        {force=true, bang=true, nargs='*', complete='file'}
    },
    Wq = {
        function(keys)
            local cmd = 'wq'
            if keys.bang then cmd = cmd .. '!' end
            vim.cmd(cmd .. ' ' .. keys.args)
        end,
        {force=true, bang=true, nargs='*', complete='file'}
    },
    WQ = {
        function(keys)
            local cmd = 'wq'
            if keys.bang then cmd = cmd .. '!' end
            vim.cmd(cmd .. ' ' .. keys.args)
        end,
        {force=true, bang=true, nargs='*', complete='file'}
    },
    Wa = {
        function(keys)
            local cmd = 'wa'
            if keys.bang then cmd = cmd .. '!' end
            vim.cmd(cmd .. ' ' .. keys.args)
        end,
        {force=true, bang=true, nargs='*', complete='file'}
    },
    WA = {
        function(keys)
            local cmd = 'wa'
            if keys.bang then cmd = cmd .. '!' end
            vim.cmd(cmd .. ' ' .. keys.args)
        end,
        {force=true, bang=true, nargs='*', complete='file'}
    },
    Q = {
        function(keys)
            local cmd = 'q'
            if keys.bang then cmd = cmd .. '!' end
            vim.cmd(cmd .. ' ' .. keys.args)
        end,
        {force=true, bang=true, nargs='*', complete='file'}
    },
    Qa = {
        function(keys)
            local cmd = 'qa'
            if keys.bang then cmd = cmd .. '!' end
            vim.cmd(cmd .. ' ' .. keys.args)
        end,
        {force=true, bang=true, nargs='*', complete='file'}
    },
    QA = {
        function(keys)
            local cmd = 'qa'
            if keys.bang then cmd = cmd .. '!' end
            vim.cmd(cmd .. ' ' .. keys.args)
        end,
        {force=true, bang=true, nargs='*', complete='file'}
    },
}
