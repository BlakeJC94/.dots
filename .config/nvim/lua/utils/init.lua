local M = {}

M.get = require('utils._get')
M.set = require('utils._set')

M.setup_packer = function()
    local packer_location = '/site/pack/packer/start/packer.nvim'
    local install_path = vim.fn.stdpath('data') .. packer_location

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        local packer_url = 'https://github.com/wbthomason/packer.nvim'
        local install_cmd = table.concat(
            {'!git clone', packer_url, install_path},
            ' '
        )
        vim.fn.execute(install_cmd)
    end

    vim.cmd("packadd packer.nvim")
end

return M
