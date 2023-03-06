local M = {}

M.requires = { "hrsh7th/cmp-nvim-lsp" }

function M.config()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local lsp_settings = {
        pyright = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic",
                    diagnosticSeverityOverrides = {
                        -- reportGeneralTypeIssues = "warning",
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

    local function on_attach()
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
    end

    for lsp, settings in pairs(lsp_settings) do
        local config_spec = {
            on_attach = on_attach,
            capabilities = cmp_nvim_lsp.default_capabilities(),
            flags = { debounce_text_changes = 150 },
            settings = settings,
        }
        if lsp == "pyright" then
            config_spec['cmd'] = { 'pyright-langserver', '--stdio' }
        end

        lspconfig[lsp].setup(config_spec)
    end

    vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
    })
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for sign_type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. sign_type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

return M
