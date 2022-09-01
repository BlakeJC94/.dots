local SETTERS = {}

SETTERS.options = function(options)
    for k, v in pairs(options) do vim.opt[k] = v end
end

SETTERS.functions = function(func)
    _G.name = func
end

SETTERS.autocommands = function(autocommands)
    for name, augroup in pairs(autocommands) do
        local id = vim.api.nvim_create_augroup(name, {clear = true})
        for _, autocmd in pairs(augroup) do
            vim.api.nvim_create_autocmd(
                autocmd.events,
                {
                    group = id,
                    pattern = autocmd.pattern,
                    callback = autocmd.callback,
                }
            )
        end
    end
end

SETTERS.commands = function(commands)
    local DEFAULT_CMD_OPTS = {force = true}
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

-- TODO find a nicer solution than this, maybe a dir?
SETTERS.mappings = function(mappings)
    local DEFAULT_MAP_OPTS = {noremap = true, silent = true}
    for mode, mode_mappings in pairs(mappings) do
        for keys, mapping in pairs(mode_mappings) do
            if (type(mapping) == "table") then
                local opts = vim.tbl_extend('force', DEFAULT_MAP_OPTS, mapping.opts)
                vim.keymap.set(mode, keys, mapping.map, opts)
            else
                vim.keymap.set(mode, keys, mapping, DEFAULT_MAP_OPTS)
            end
        end
    end
end

SETTERS.plugins = function(plugins)
    local status_ok, packer = pcall(require, "packer")
    if not status_ok then
        error("Packer not properly installed, skipping plugin loading.")
        return
    end

    local configs = require('configs')

    packer.init()
    packer.reset()
    packer.use({'wbthomason/packer.nvim'})

    for _, plugin in pairs(plugins) do
        local repo = {plugin}

        local plugin_name = string.match(plugin, '[^/]+/[^/]+$')
        plugin_name = string.match(plugin_name, '/[^.]+')
        plugin_name = string.sub(plugin_name, 2, -1)

        if configs[plugin_name] ~= nil then
            repo = vim.tbl_extend("force", repo, configs[plugin_name])
            configs[plugin_name] = nil
        end
        packer.use(repo)
    end

    for k, v in pairs(configs) do
        if v ~= nil then
            print("Warning: no plugin found for config `" .. k .. ".lua`")
        end
    end

    packer.install()
end

return SETTERS
