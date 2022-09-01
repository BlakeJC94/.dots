local autocommands_dir = vim.fn.expand('$HOME') .. '/.config/nvim/lua/autocommands'
local augroups = {}

local file_list = vim.fn.readdir(autocommands_dir)
for _, file in pairs(file_list) do
    if file ~= 'init.lua' then
        local augroup_name = string.sub(file, 1, -5)
        augroups[augroup_name] = require('autocommands.' .. augroup_name)
    end
end

return augroups

