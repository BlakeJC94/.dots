DEFAULT_MAP_OPTS = {noremap = true, silent = true}

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

M = {}

M.setup_packer = function()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    local packer_url = 'https://github.com/wbthomason/packer.nvim'

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        install_cmd = table.concat({'!git clone', packer_url, install_path}, ' ')
        vim.fn.execute(install_cmd)
    end

    -- Update plugins after saving changes to plugins.lua
    vim.api.nvim_exec([[
        augroup Packer
            autocmd!
            autocmd BufWritePost plugins.lua source <afile> | PackerCompile
            autocmd BufWritePost configs.lua source <afile> | PackerCompile
        augroup end
    ]], false)

    -- Add packer to managed plugins
    vim.cmd("packadd packer.nvim")
end

M.disable_built_ins = function()
    for _, i in pairs(DISABLED_BUILT_INS) do
        vim.g['loaded_' .. i] = 1
    end
end

M.set_mapping_group = function(mapping_group)
    for mode, mappings in pairs(mapping_group) do
        for keys, mapping in pairs(mappings) do
            if (type(mapping) == "table") then
                local opts = vim.tbl_extend('force', DEFAULT_MAP_OPTS, mapping.opts)
                vim.api.nvim_set_keymap(mode, keys, mapping.map, opts)
            else
                vim.api.nvim_set_keymap(mode, keys, mapping, DEFAULT_MAP_OPTS)
            end
        end
    end
end

M.set_command_group = function(command_group)
    -- TODO docs
    for name, val in pairs(command_group) do
        if (type(val) == "table") then
            local cmd_str = {'command!'}
            if val.bang == true then
                table.insert(cmd_str, '-bang')
            end
            if val.count then
                table.insert(cmd_str, '-count=' .. val.count)
            end
            if val.nargs then
                table.insert(cmd_str, '-nargs=' .. val.nargs)
            end
            if val.complete then
                table.insert(cmd_str, '-complete=' .. val.complete)
            end
            table.insert(cmd_str, name)
            table.insert(cmd_str, val.cmd)
            cmd_str = table.concat(cmd_str, ' ')
            vim.cmd(cmd_str)
        else
            local cmd_str = table.concat({'command!', name, val}, ' ')
            vim.cmd(cmd_str)
        end
    end
end

M.set_autogroup = function(autogroup)
    group_name = autogroup.name
    group = autogroup.cmds

    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')
    for filetype, autocmd in pairs(group) do
        if (type(autocmd) == "table") then
            for _, vals in pairs(autocmd) do
                local command = vim.tbl_flatten({'autocmd', vals.events, filetype, vals.cmd})
                local command = table.concat(command, ' ')
                vim.cmd(command)
            end
        else
            local command = table.concat(vim.tbl_flatten{'autocmd', autocmd}, ' ')
            vim.cmd(command)
        end
    end
    vim.cmd('augroup END')
end

return M
