-- BLAKEJC94S NEOVIM INIT.LUA
-- ==========================
local utils = require('utils')

local NVIM_CONFIG = {
    plugins =      utils.get.plugins(),
    options =      utils.get.options(),
    functions =    utils.get.functions(),
    commands =     utils.get.commands(),
    autocommands = utils.get.autocommands(),
    mappings =     utils.get.mappings(),
}

utils.setup_packer()
vim.g.mapleader = " "
for key, table in pairs(NVIM_CONFIG) do
    utils.set[key](table)
end

require("scratchpad")
