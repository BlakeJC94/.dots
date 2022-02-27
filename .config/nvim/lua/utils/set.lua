M = {}

M.options = function(options)
    for i, opts in pairs(options) do
        for k, v in pairs(opts) do
            vim.opt[k] = v
        end
    end
end

M.modules = function(modules)
    -- Use a protected call so we don't error out on first use.
    local status_ok, packer = pcall(require, "packer")
    if not status_ok then
        return
    end

    require('utils.helpers').disable_built_ins()
    require('utils.helpers').setup_packer()


    local packer = require('packer')

    local repos = {}
    for _, module_name in ipairs(modules) do
        module = require(module_name)
        for k, v in pairs(module) do
            table.insert(repos, vim.tbl_extend("force", {k}, v))
        end
    end

    packer.init()
    packer.reset()
    packer.use({'wbthomason/packer.nvim'})
    for _, repo in ipairs(repos) do
        packer.use(repo)
    end
    packer.install()
end

M.mappings = function(mappings)
    vim.g.mapleader = " "

    local mapping_groups = {}
    for _, mapping_group_name in ipairs(mappings) do
        group = require('mappings.' .. mapping_group_name)
        table.insert(mapping_groups, group)
    end

    for _, mapping_group in ipairs(mapping_groups) do
        require('utils.helpers').set_mapping_group(mapping_group)
    end
end

M.commands = function(commands)

    local command_groups = {}
    for _, command_group_name in ipairs(commands) do
        group = require('commands.' .. command_group_name)
        table.insert(command_groups, group)
    end

    for _, command_group in ipairs(command_groups) do
        require("utils.helpers").set_command_group(command_group)
    end
end

M.autogroups = function(autogroups)
    local autogroup_groups = {}
    for _, autogroup_group_name in ipairs(autogroups) do
        group = require('autogroups.' .. autogroup_group_name)
        table.insert(autogroup_groups, group)
    end

    for _, autogroup in ipairs(autogroup_groups) do
        require("utils.helpers").set_autogroup(autogroup)
    end
end

return M
