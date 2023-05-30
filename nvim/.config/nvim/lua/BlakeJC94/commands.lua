local functions = require('BlakeJC94.functions')
local opts = {force = true}

-- TODO add directly to mapping
-- TODO concat all commands as a large list then set?
local commands = {
    {"ToggleQL", functions.toggle_quickfix_list, opts},
    {"ToggleLL", functions.toggle_local_list, opts},
    {"PylintDisableLine", functions.pylint_disable_line, opts},
    {"Bonly", functions.close_all_except_selected_buffer, opts},
}

local function set_commands(cmds)
    for _, cmd in pairs(cmds) do
        vim.api.nvim_create_user_command(unpack(cmd))
    end
end

local function make_typo_command(cmd)
    local typo_function = function(keys)
        if keys.bang then cmd = cmd .. '!' end
        vim.cmd(string.lower(cmd) .. ' ' .. keys.args)
    end
    return {cmd, typo_function, {force=true, bang=true, nargs='*', complete='file'}}
end

local function set_typo_commands()
    local typos = { "E" , "W" , "Wq", "WQ", "Wa", "WA", "Q" , "Qa", "QA" }

    local typo_commands = {}
    for _, v in pairs(typos) do
        typo_commands[#typo_commands + 1] = make_typo_command(v)
    end

    set_commands(typo_commands)
end

local M = {}

function M.set()
    set_commands(commands)
    set_typo_commands()
end

return M
