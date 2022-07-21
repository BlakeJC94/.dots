M = {}

DEFAULT_MAP_OPTS = {noremap = true, silent = true}
DEFAULT_CMD_OPTS = {force = true}

-- -----------------------------
SETTERS = {}
SETTERS.options = function(_, options)
    for k, v in pairs(options) do vim.opt[k] = v end
end

SETTERS.functions = function(name, func)
    _G.name = func
end

SETTERS.autocommands = function(name, autocommands)
    local id = vim.api.nvim_create_augroup(name, {clear = true})
    for _, autocmd in pairs(autocommands) do
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

SETTERS.commands = function(_, commands)
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

SETTERS.mappings = function(_, mappings)
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

M.load = function(mode, groups)
    local setter = SETTERS[mode]
    if setter == nil then error("Invalid `mode` passed to SETTERS") end
    if type(groups) ~= "table" then error("Expected `groups` to be a table") end
    for name, group in pairs(groups) do setter(name, group) end
end

M.setup_packer = function()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    local packer_url = 'https://github.com/wbthomason/packer.nvim'

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        install_cmd = table.concat({'!git clone', packer_url, install_path}, ' ')
        vim.fn.execute(install_cmd)
    end

    -- Add packer to managed plugins
    vim.cmd("packadd packer.nvim")
end

M.add_plugins = function(packer_config, packer)
    plugins = packer_config.plugins
    configs = packer_config.configs
    packer.init()
    packer.reset()
    packer.use({'wbthomason/packer.nvim'})
    for _name, repos in pairs(plugins) do
        for _, repo in pairs(repos) do
            local repo_config = {repo}
            if configs[repo] ~= nil then
                repo_config = vim.tbl_extend("force", repo_config, configs[repo])
            end
            packer.use(repo_config)
        end
    end
    packer.install()
end

return M
