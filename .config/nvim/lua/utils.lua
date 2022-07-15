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

M.my_fold_text = function()
    local line = vim.fn.getline(vim.v.foldstart)

    local indent_str = string.rep(" ", vim.fn.indent(vim.v.foldstart - 1))
    local fold_str = indent_str .. line .. string.rep(" ", 100)

    local fold_size = vim.v.foldend - vim.v.foldstart + 1
    local fold_size_str = " (" .. fold_size .. ") "

    return string.sub(fold_str, 0, 100 - #fold_size_str) .. fold_size_str
end

M.replace_keycodes = function()
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.load_functions = function()
    require('functions')
end

M.load_commands = function()
    require('commands')
end

M.load_autocommands = function()
    require('autocommands')
end

M._parse_table_vargs = function(...)
    local args = {...}
    if #args == 0 then return nil end

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

M.load_options = function(...)
    groups = require('utils')._parse_table_vargs(...)
    if groups then
        for _i, options in ipairs(groups) do
            for k, v in pairs(options) do vim.opt[k] = v end
        end
    end
end

M.load_mappings = function(...)
    groups = require('utils')._parse_table_vargs(...)
    if groups then
        for _i, mappings in ipairs(groups) do
            utils._set_mappings(mappings)
        end
    end
end


return M

