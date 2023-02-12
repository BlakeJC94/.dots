local M = {}

local addons = require("BlakeJC94.addons")
local options = require("BlakeJC94.options")
local commands = require("BlakeJC94.commands")
local mappings = require("BlakeJC94.mappings")
local augroups = require("BlakeJC94.augroups")

local set = require("BlakeJC94.utils").set
local pack = require("BlakeJC94.utils").pack

function M.setup(config)
    config = config or {}

    if config.addons then set.addons(addons) end
    if config.options then set.options(options) end
    if config.commands then set.commands(commands) end
    if config.mappings then set.mappings(mappings) end
    if config.augroups then set.augroups(augroups) end

    if config.scratchpad then require("BlakeJC94.scratchpad") end
end

M.filetype_exclude = {
    "help",
    "man",
    "packer",
    "fugitive",
    "mason",
    "FTerm",
}

M.filetype_include = {
    "bash",
    "julia",
    "lua",
    "python",
    "r",
    "rust",
    "vim",
}

return M
