-- This file is for creating new vim commands
local functions = require('BlakeJC94.utils').functions

local M = {}

-- Toggle display of quickfix list
function M.ToggleQL()
    if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix') == 0 then
        vim.cmd.copen()
    else
        vim.cmd.cclose()
    end
end

-- Toggle display of location list
function M.ToggleLL()
    if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.loclist') == 0 then
        vim.cmd.lopen()
    else
        vim.cmd.lclose()
    end
end

function M.PylintDisableLine()
    functions.pylint_disable_line()
end

function M.Bonly()
    vim.cmd('%bdelete|edit #|normal `"')
end

local function make_typo_command(cmd)
    local typo_function = function(keys)
        if keys.bang then cmd = cmd .. '!' end
        vim.cmd(string.lower(cmd) .. ' ' .. keys.args)
    end
    return {typo_function, {force=true, bang=true, nargs='*', complete='file'}}
end

local typos = { "E" , "W" , "Wq", "WQ", "Wa", "WA", "Q" , "Qa", "QA" }
for _, v in pairs(typos) do M[v] = make_typo_command(v) end

return M
