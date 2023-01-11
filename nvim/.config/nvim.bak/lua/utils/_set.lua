local M = {}

M.plugins = function(repos)
    local status_ok, packer = pcall(require, "packer")
    if not status_ok then
        error("Warning: Packer not properly installed, skipping plugin loading.")
        return
    end

    packer.init({
        snapshot_path = vim.fn.stdpath("config") .. "/snapshots",
        snapshot = "packer.json",
    })
    packer.reset()
    packer.use({'wbthomason/packer.nvim'})

    for _, repo in pairs(repos) do
        packer.use(repo)
    end

    packer.install()
end

M.options = function(options)
    for k, v in pairs(options) do vim.opt[k] = v end
end

M.functions = function(functions)
    for name, func in pairs(functions) do _G[name] = func end
end

M.commands = function(commands)
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

M.autocommands = function(autocommands)
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

M.mappings = function(mappings)
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


return M

