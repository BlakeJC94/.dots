local M = {}

local addons = require("BlakeJC94.addons")
local options = require("BlakeJC94.options")
local commands = require("BlakeJC94.commands")
local mappings = require("BlakeJC94.mappings")
local augroups = require("BlakeJC94.augroups")

function M.setup(config)
    config = config or {}

    if config.addons then addons.set() end
    if config.options then options.set() end
    if config.commands then commands.set() end
    if config.mappings then mappings.set() end
    if config.augroups then augroups.set() end

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
                autoSearchPaths = false,
                useLibraryCodeForTypes = false,
                diagnosticMode = "openFilesOnly",
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
    ruff_lsp = {},
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
        -- pylint = { prefer_local = ".venv/bin" },
        luacheck = {},
    },
}

M.packer_mappings = {
    {"n", '<Leader>..',':exec "PackerSync" | echo "Syncing plugins"<CR>'},
    {"n", '<Leader>.i',':exec "PackerInstall" | echo "Installing plugins"<CR>'},
    {"n", '<Leader>.u',':exec "PackerUpdate" | echo "Updating plugins.."<CR>'},
    {"n", '<Leader>.c',':exec "PackerCompile" | echo "Compiling plugins.."<CR>'},
    {"n", '<Leader>.C',':exec "PackerClean" | echo "Cleaning plugins.."<CR>'},
    {"n", '<Leader>.s',':exec "PackerStatus" | echo "Plugin status"<CR>'},
    {"n", '<Leader>.a',":GotoConfig<CR>"},
    {"n", '<Leader>.S',":source $MYVIMRC<CR>"},
}

return M
