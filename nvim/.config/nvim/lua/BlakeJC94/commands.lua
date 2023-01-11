-- This file is for creating new vim commands
local functions = require('BlakeJC94.functions')
local DEFAULT_CMD_OPTS = {force = true}

local commands = {}

-- Toggle display of quickfix list
commands['ToggleQL'] = function()
    if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix') == 0 then
        vim.cmd.copen()
    else
        vim.cmd.cclose()
    end
end

-- Toggle display of location list
commands['ToggleLL'] = function()
    if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.loclist') == 0 then
        vim.cmd.lopen()
    else
        vim.cmd.lclose()
    end
end

-- Open notes
commands['Notes'] = function()
    vim.cmd.lcd('~/Dropbox/Journals')
    vim.cmd.edit('~/Dropbox/Journals')
end

commands['Note'] = {
    function(keys) functions.new_note(keys.args) end,
    {force=true, nargs='?'}
}

commands['PylintDisableLine'] = function()
    functions.pylint_disable_line()
end

local function make_typo_command(cmd)
    local typo_function = function(keys)
        if keys.bang then cmd = cmd .. '!' end
        vim.cmd(string.lower(cmd) .. ' ' .. keys.args)
    end
    return {typo_function, {force=true, bang=true, nargs='*', complete='file'}}
end

local typos = { "E" , "W" , "Wq", "WQ", "Wa", "WA", "Q" , "Qa", "QA" }
for _, v in pairs(typos) do commands[v] = make_typo_command(v) end

local function set_commands(commands)
    for name, command in pairs(commands) do
        if (type(command) == 'table') then
            local opts = vim.tbl_extend('force', DEFAULT_CMD_OPTS, command[2])
            vim.api.nvim_create_user_command(
                name,
                command[1],
                opts
            )
        else
            vim.api.nvim_create_user_command(
                name,
                command,
                DEFAULT_CMD_OPTS
            )
        end
    end
end
set_commands(commands)
return commands
