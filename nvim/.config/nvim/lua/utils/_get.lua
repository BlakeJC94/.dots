local M = {}

M.plugins = function()
    local configs_dir = vim.fn.expand('$HOME') .. '/.config/nvim/lua/addons/configs'
    local configs = {}
    _G._configs = {}

    _G._configs.filetype_exclude = {
        "help",
        "man",
        "packer",
        "fugitive",
        "mason",
        "FTerm",
    }

    _G._configs.filetype_include = {
        "python",
        "lua",
        "bash",
        "julia",
        "r",
        "vim",
    }


    local file_list = vim.fn.readdir(configs_dir)
    for _, file in pairs(file_list) do
        local plugin_name = string.sub(file, 1, -5)
        configs[plugin_name] = require('addons.configs.' .. plugin_name)
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

    local pause = false
    for k, v in pairs(configs) do
        if v ~= nil and string.sub(k, 1, 1) ~= "_" then
            print("Warning: no plugin found for config `" .. k .. ".lua`")
            pause = true
        end
    end
    if pause then
        vim.fn.input('Press any key to continue.')
    end

    return repos
end

M.options = function()
    return require('options')
end

M.functions = function()  -- TODO split this into a folder
    return require('functions')
end

M.commands = function()
    return require('commands')
end

M.autocommands = function()
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
end

M.mappings = function()
    local mappings_dir = vim.fn.expand('$HOME') .. '/.config/nvim/lua/addons/mappings'
    local mappings = require('mappings')

    local file_list = vim.fn.readdir(mappings_dir)
    for _, file in pairs(file_list) do
        local name = string.sub(file, 1, -5)
        local mapping_group = require('addons.mappings.' .. name)

        for mode, maps in pairs(mapping_group) do
            if mappings[mode] == nil then
                mappings[mode] = {}
            end
            for key, map in pairs(maps) do
                if mappings[mode][key] ~= nil then
                    print("Warning: Overriding key `" .. key .."` in mode `" .. mode .. "`.")
                end
                mappings[mode][key] = map
            end
        end
    end

    return mappings
end


return M
