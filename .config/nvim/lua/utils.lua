M = {}

DISABLED_BUILT_INS = {
    'netrw',
    'netrwPlugin',
    'gzip',
    'man',
    'shada_plugin',
    'tarPlugin',
    'tar',
    'zipPlugin',
    'zip',
    'netrwPlugin',
    'tutor_mode_plugin',
    'remote_plugins',
    'spellfile_plugin',
    '2html_plugin',
}

DEFAULT_MAP_OPTS = {noremap = true, silent = true}
DEFAULT_CMD_OPTS = {force = true}


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

M.disable_built_ins = function()
    for _, i in pairs(DISABLED_BUILT_INS) do
        vim.g['loaded_' .. i] = 1
    end
end

M._set_commands = function(commands)
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

M._set_mappings = function(mappings)
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

M._set_augroup = function(name, augroup)
    local id = vim.api.nvim_create_augroup(name, {clear = true})
    for _name, autocmd in pairs(augroup) do
        local events = autocmd[1]
        local cmd = autocmd[2]
        vim.api.nvim_create_autocmd(
            events,
            {
                group = id,
                pattern = cmd.pattern,
                callback = cmd.callback,
            }
        )
    end
end

M._set_options = function(_, options)
    for k, v in pairs(options) do vim.opt[k] = v end
end

M._parse_table_vargs = function(...)
    local args = {...}
    if #args == 0 then return nil end
    -- if type(args) == 'table' and
    
    -- Is the input just one table? If so, return the input
    -- if #args == 1 and type(args[1][next(args[1])]) == 'table' then
    -- if #args == 1 then
    --     local single_arg = args[next(args)]
    --     print("PARSE----")
    --     print("  type of single_arg", type(single_arg))
    --     print("  len of single_arg", #single_arg)
    --     -- print(vim.inspect(single_arg))



    --     local first_arg = args[1][next(args[1])]
    --     print(vim.inspect(first_arg))
    --     return args[1]
    -- end


    local groups = {}
    local index = 0
    for i = 1, #args do
        if type(args[i]) ~= 'table' or type(next(args[i])) then
            index = index + 1
            groups[index] = args[i]
        end
    end

    return groups
end

-- M.load = function(setter, ...)
--     groups = require('utils')._parse_table_vargs(...)
--     if not groups then return end
--     for key, values in pairs(groups) do
--         setter(key, values)
--     end
-- end

M.load_options = function(...)
    groups = require('utils')._parse_table_vargs(...)
    if not groups then return end
    for _i, options in ipairs(groups) do
        require('utils')._set_options(_i, options)
    end
end

M.load_mappings = function(...)
    groups = require('utils')._parse_table_vargs(...)
    if not groups then return end
    for _i, mappings in ipairs(groups) do
        utils._set_mappings(mappings)
    end
end

M.load_commands = function(...)
    groups = require('utils')._parse_table_vargs(...)
    if not groups then return end
    for _i, commands in ipairs(groups) do
        utils._set_commands(commands)
    end
end

-- TODO write docs explaining that this input should just be one table
M.load_functions = function(...)
    groups = require('utils')._parse_table_vargs(...)
    if not groups then return end
    for _i, group in ipairs(groups) do
        for name, func in pairs(group) do
            _G.name = func
        end
    end
end

-- TODO write docs explaining that this input should just be one table
M.load_autocommands = function(...)
    groups = require('utils')._parse_table_vargs(...)
    if not groups then return end
    for _i, group in ipairs(groups) do
        for name, augroup in pairs(group) do

            local id = vim.api.nvim_create_augroup(name, {clear = true})
            for _name, autocmd in pairs(augroup) do
                local events = autocmd[1]
                local cmd = autocmd[2]
                vim.api.nvim_create_autocmd(
                    events,
                    {
                        group = id,
                        pattern = cmd.pattern,
                        callback = cmd.callback,
                    }
                )
            end
        end
    end
end

return M

