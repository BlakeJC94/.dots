-- TODO other plugins to add:
-- TODO add vimtips-fortune to landing page?
-- - codi
-- - nvim-lightbulb
-- - lsp_signature
-- - vim-illuminate
-- TODO is there a better plugin for python cheatsheets?
-- TODO install mkdnflow


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

M.load_plugins = function()
    local packer = require('packer')

    local repos = {}
    local modules = {
        require('modules.colours'),
        require('modules.completion'),
        require('modules.editor'),
        require('modules.files'),
        require('modules.git'),
        require('modules.languages'),
        require('modules.lsp'),
        require('modules.terminal'),
        require('modules.ui'),
        require('modules.window'),
    }
    for _, module in ipairs(modules) do
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

return M
