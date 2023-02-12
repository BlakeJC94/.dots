local M = {}

function M.addons(repos)
    local pack = require("BlakeJC94.utils").pack
    local packer_bootstrap = pack.ensure_packer()
    local status_ok, packer = pcall(require, "packer")
    if not status_ok then
        print("Warning: Packer not properly installed, skipping plugin loading.")
        return
    end
    pack.configure_packer(packer)
    for _, repo in ipairs(repos) do
        packer.use(pack.assemble_packer_module(repo))
    end
    packer.install()
    if packer_bootstrap then
        packer.sync()
    end
end

function M.options(options)
    for k, v in pairs(options) do vim.opt[k] = v end
end

function M.commands(commands)
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

function M.mappings(mappings)
    local DEFAULT_MAP_OPTS = {remap = false, silent = true}
    vim.g.mapleader = " "
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

function M.augroups(augroups)
    for name, augroup in pairs(augroups) do
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

return M
