M = {}

DEFAULT_MAP_OPTS = {noremap = true, silent = true}
DEFAULT_CMD_OPTS = {force = true}

-- -----------------------------
SETTERS = {}
SETTERS.options = function(_, options)
    for k, v in pairs(options) do vim.opt[k] = v end
end

SETTERS.functions = function(_, func)
    _G.name = func
end

SETTERS.autocommands = function(_, autocommands)
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

-- TODO find a nicer solution than this, maybe a dir?
SETTERS.mappings = function(_, mappings)
    for _, group_mappings in pairs(mappings) do
        for mode, mode_mappings in pairs(group_mappings) do
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
end

SETTERS.plugins = function(_, plugins)
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
        if configs[plugin] ~= nil then
            repo = vim.tbl_extend("force", repo, configs[plugin])
        end
        packer.use(repo)
    end
    packer.install()
end

M.load = function(mode, table)
    local setter = SETTERS[mode]
    if setter == nil then error("Invalid `mode` passed to SETTERS") end
    setter(nil, table)
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



return M
