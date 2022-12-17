_G._configs.lspconfig_configure_diagnostics = function()
    vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
    })

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

_G._configs.lspconfig_get_lsp_settings = function()
    return {
        pyright = {
            python = {
                -- venvPath = os.getenv("PYENV_ROOT") .. '/versions',
                -- venv = string.gsub(os.getenv("VIRTUAL_ENV"), "/%S+/", ""),
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
        sumneko_lua = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = {'vim'} },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                telemetry = { enable = false },
            },
        },
        julials = {},
        bashls = {},
        rust_analyzer = {},
    }
end

_G._configs.lspconfig_get_capabilities = function()
    return require('cmp_nvim_lsp').default_capabilities()
end

-- Specify actions to happen when lsp server starts on a buffer
_G._configs.lspconfig_on_attach = function()
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

return {
    requires = {
        "hrsh7th/cmp-nvim-lsp",  -- cmp integration for lsp
        "ii14/lsp-command",  -- :Lsp <cmd> => Command interface for LSP functions
        "Mofiqul/trld.nvim",  -- display diagnostic status in top right
    },
    config = function()
        local lspconfig = require('lspconfig')

        _G._configs.lspconfig_configure_diagnostics()

        local lsp_settings = _G._configs.lspconfig_get_lsp_settings()
        local capabilities = _G._configs.lspconfig_get_capabilities()
        for lsp, settings in pairs(lsp_settings) do
            lspconfig[lsp].setup({
                on_attach = _G._configs.lspconfig_on_attach,
                capabilities = capabilities,
                flags = { debounce_text_changes = 150 },
                settings = settings,
            })
        end

        require('trld').setup({})
    end
}
