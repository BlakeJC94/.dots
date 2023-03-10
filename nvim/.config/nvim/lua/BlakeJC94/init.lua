local M = {}

local addons = require("BlakeJC94.addons")
local options = require("BlakeJC94.options")
local commands = require("BlakeJC94.commands")
local mappings = require("BlakeJC94.mappings")
local leaders = require("BlakeJC94.leaders")
local augroups = require("BlakeJC94.augroups")

local utils = require("BlakeJC94.utils")

function M.setup(config)
    config = config or {}

    vim.g.mapleader = " "

    if config.addons then utils.set.addons(addons) end
    if config.options then utils.set.options(options) end
    if config.commands then utils.set.commands(commands) end
    if config.mappings then utils.set.mappings(mappings) end
    if config.leaders then utils.set.mappings(leaders) end
    if config.augroups then utils.set.augroups(augroups) end

    utils.add_undo_breakpoints_insert_mode_punctuation()
    utils.disable_arrow_keys()
    utils.setup_goto_config()

    vim.g.python3_host_prog = vim.fn.expand("~/.asdf/shims/python3")

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

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.lsp_sources = {
    pyright = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
                diagnosticSeverityOverrides = {
                    reportGeneralTypeIssues = "none",
                    reportOptionalMemberAccess = "none",
                    reportOptionalSubscript = "none",
                    reportPrivateImportUsage = "none",
                },
            },
        },
    },
    lua_ls = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
    julials = {},
    bashls = {},
    rust_analyzer = {},
}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
M.null_ls_sources = {
    formatting = {
        black = { timeout = 5000 },
        jq = {},
        stylua = {},
        rustfmt = {},
    },
    diagnostics = {
        pylint = { prefer_local = ".venv/bin" },
        luacheck = {},
    },
}

return M
