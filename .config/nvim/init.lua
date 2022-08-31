-- BLAKEJC94S NEOVIM INIT.LUA
-- --------------------------

local utils = require('utils')

local NVIM_CONFIG = {
    plugins =      require("plugins"),
    options =      require("options"),
    functions =    require("functions"),
    autocommands = require("autocommands"),
    commands =     require("commands"),
    mappings =     require("mappings"),
}

vim.g.mapleader = " "
utils.setup_packer()
for key, table in pairs(NVIM_CONFIG) do utils.load(key, table) end
