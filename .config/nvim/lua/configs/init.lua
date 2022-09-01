local configs_dir = vim.fn.expand('$HOME') .. '/.config/nvim/lua/configs'
local configs = {}

local file_list = vim.fn.readdir(configs_dir)
for _, file in pairs(file_list) do
    if file ~= 'init.lua' then
        local plugin_name = string.sub(file, 1, -5)
        configs[plugin_name] = require('configs.' .. plugin_name)
    end
end

return configs
