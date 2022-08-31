-- BLAKEJC94S NEOVIM INIT.LUA
-- --------------------------

-- Load modules
local NVIM_CONFIG = {
    plugins =      require("plugins"),
    options =      require("options"),
    functions =    require("functions"),
    autocommands = require("autocommands"),
    commands =     require("commands"),
    mappings =     require("mappings"),
}

-- Setup packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_url = 'https://github.com/wbthomason/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    install_cmd = table.concat({'!git clone', packer_url, install_path}, ' ')
    vim.fn.execute(install_cmd)
end
vim.cmd("packadd packer.nvim")

-- Set leader key
vim.g.mapleader = " "

-- Set modules
utils = require('utils')
for key, table in pairs(NVIM_CONFIG) do utils[key](table) end
