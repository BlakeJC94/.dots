local M = {}

M.requires = {
    "hrsh7th/cmp-nvim-lsp",
}

local function on_attach()
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

function M.config()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local lsp_sources = require("BlakeJC94").lsp_sources

    for lsp, settings in pairs(lsp_sources) do
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
