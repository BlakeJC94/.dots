local M = {}

M.plugins = function()
    local configs_dir = vim.fn.expand('$HOME') .. '/.config/nvim/lua/configs'
    local configs = {}

    local file_list = vim.fn.readdir(configs_dir)
    for _, file in pairs(file_list) do
        local plugin_name = string.sub(file, 1, -5)
        configs[plugin_name] = require('configs.' .. plugin_name)
    end

    local plugins = require('plugins')
    local repos = {}

    for _, plugin in pairs(plugins) do
        local repo = {plugin}

        local plugin_name = string.match(plugin, '[^/]+/[^/]+$')
        plugin_name = string.match(plugin_name, '/[^.]+')
        plugin_name = string.sub(plugin_name, 2, -1)

        if configs[plugin_name] ~= nil then
            repo = vim.tbl_extend("force", repo, configs[plugin_name])
            configs[plugin_name] = nil
        end
        table.insert(repos, repo)
    end

    for k, v in pairs(configs) do
        if v ~= nil then
            print("Warning: no plugin found for config `" .. k .. ".lua`")
        end
    end

    return repos
end





return M
