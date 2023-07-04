local M = {}

M.requires = {
    "hrsh7th/cmp-nvim-lsp",
}

local function on_attach()
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(0, "tagfunc", "v:lua.vim.lsp.tagfunc")
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

M.mappings = {
    { "n", "]d", function() vim.diagnostic.goto_next() end },
    { "n", "[d", function() vim.diagnostic.goto_prev() end },
    { "n", "gd", function() vim.lsp.buf.definition() end },
    { "n", "gD", function() vim.lsp.buf.declaration() end },
    { "n", "gI", function() vim.lsp.buf.implementation() end },
    { "n", "gy", function() vim.lsp.buf.type_definition() end },
    { "n", "gR", function() vim.lsp.buf.references() end },
    { "n", "g=", function() vim.lsp.buf.format() end },
    { "n", '<Leader>e', function() vim.diagnostic.open_float() end },        -- Show line diagnostics
    { "n", '<Leader>E', function() vim.diagnostic.setloclist() end },        -- Show buffer diagnostics
    { "n", '<Leader>=', function() vim.lsp.buf.format({ timeout_ms = 10000  }) end},               -- Format buffer
    { "n", '<Leader>r', function() vim.lsp.buf.rename() end },               -- Rename current symbol
    { "n", '<Leader>R', function() vim.lsp.buf.references() end },
    { "n", '<Leader>k', function() vim.lsp.buf.signature_help() end },       -- Show signature help
    { "n", '<Leader>A', function() vim.lsp.buf.code_action() end },          -- Do code action
    { "n", '<Leader>v', function() vim.lsp.buf.document_symbol() end },
    -- Make K (<C-k> for insert mode) use lsp.hover, call twice to jump to hoverdoc
    { "n", "K", function() vim.lsp.buf.hover() end},
    { "i", "<C-k>", function() vim.lsp.buf.hover() end},
}

return M
