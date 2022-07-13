-- Edit settings
vim.api.nvim_create_user_command(
    'Settings',
    function()
        vim.cmd('edit $MYVIMRC')
        vim.cmd('lcd %:p:h')
        print('Editing settings: ' .. vim.fn.expand('%:p'))
    end,
    {force=true}
)

vim.api.nvim_create_user_command(
    'NewSession',
    function()
        vim.cmd('bufdo bdel')
        vim.cmd('enew')
        print('[New session]')
    end,
    {force=true}
)

vim.api.nvim_create_user_command(
    'ChangeDir',
    function()
        vim.cmd('cd ' .. vim.fn.expand('%:p:h'))
        print('Changed directory to ' .. vim.fn.getcwd())
    end,
    {force=true}
)

vim.api.nvim_create_user_command(
    'ChangeLocalDir',
    function()
        vim.cmd('lcd ' .. vim.fn.expand('%:p:h'))
        print('Changed local diriectory to ' .. vim.fn.getcwd())
    end,
    {force=true}
)

vim.api.nvim_create_user_command(
    'NewFile',
    function()
        vim.cmd('enew')
        print('[New file]')
    end,
    {force=true}
)

-- Toggle display of quickfix/location list
vim.api.nvim_create_user_command(
    'ToggleQL',
    function()
        if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix') == 0 then
            vim.cmd('copen')
        else
            vim.cmd('cclose')
        end
    end,
    {force=true}
)
vim.api.nvim_create_user_command(
    'ToggleLL',
    function()
        if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.loclist') == 0 then
            vim.cmd('lopen')
        else
            vim.cmd('lclose')
        end
    end,
    {force=true}
)
-- Open notes buffer
vim.api.nvim_create_user_command(
    'Notes',
    function()
        vim.cmd('split')
        vim.cmd('lcd ~/Dropbox/Journals')
        vim.cmd('edit ~/Dropbox/Journals')
    end,
    {force=true}
)
vim.api.nvim_create_user_command(
    'Note',
    function(keys)
        _G.NewNote(keys.args)
    end,
    {force=true, nargs='?'}
)

-- Typos
vim.api.nvim_create_user_command(
    'E',
    function(keys)
        cmd = 'e'
        if keys.bang then
            cmd = cmd .. '!'
        end
        vim.cmd(cmd .. ' ' .. keys.args)
    end,
    {force=true, bang=true, nargs='*', complete='file'}
)
vim.api.nvim_create_user_command(
    'W',
    function(keys)
        cmd = 'w'
        if keys.bang then
            cmd = cmd .. '!'
        end
        vim.cmd(cmd .. ' ' .. keys.args)
    end,
    {force=true, bang=true, nargs='*', complete='file'}
)
vim.api.nvim_create_user_command(
    'Wq',
    function(keys)
        cmd = 'wq'
        if keys.bang then
            cmd = cmd .. '!'
        end
        vim.cmd(cmd .. ' ' .. keys.args)
    end,
    {force=true, bang=true, nargs='*', complete='file'}
)
vim.api.nvim_create_user_command(
    'WQ',
    function(keys)
        cmd = 'wq'
        if keys.bang then
            cmd = cmd .. '!'
        end
        vim.cmd(cmd .. ' ' .. keys.args)
    end,
    {force=true, bang=true, nargs='*', complete='file'}
)
vim.api.nvim_create_user_command(
    'Wa',
    function(keys)
        cmd = 'wa'
        if keys.bang then
            cmd = cmd .. '!'
        end
        vim.cmd(cmd .. ' ' .. keys.args)
    end,
    {force=true, bang=true, nargs='*', complete='file'}
)
vim.api.nvim_create_user_command(
    'WA',
    function(keys)
        cmd = 'wa'
        if keys.bang then
            cmd = cmd .. '!'
        end
        vim.cmd(cmd .. ' ' .. keys.args)
    end,
    {force=true, bang=true, nargs='*', complete='file'}
)
vim.api.nvim_create_user_command(
    'Q',
    function(keys)
        cmd = 'q'
        if keys.bang then
            cmd = cmd .. '!'
        end
        vim.cmd(cmd .. ' ' .. keys.args)
    end,
    {force=true, bang=true, nargs='*', complete='file'}
)
vim.api.nvim_create_user_command(
    'Qa',
    function(keys)
        cmd = 'qa'
        if keys.bang then
            cmd = cmd .. '!'
        end
        vim.cmd(cmd .. ' ' .. keys.args)
    end,
    {force=true, bang=true, nargs='*', complete='file'}
)
vim.api.nvim_create_user_command(
    'QA',
    function(keys)
        cmd = 'qa'
        if keys.bang then
            cmd = cmd .. '!'
        end
        vim.cmd(cmd .. ' ' .. keys.args)
    end,
    {force=true, bang=true, nargs='*', complete='file'}
)

