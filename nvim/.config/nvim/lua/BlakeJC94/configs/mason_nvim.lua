local M = {}

M.requires = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "williamboman/mason-lspconfig",
    "jay-babu/mason-null-ls.nvim",
    "jay-babu/mason-nvim-dap.nvim",
}

function M.config()
    require("mason").setup()

    local ensure_installed = {}

    local lsp_sources = require("BlakeJC94").lsp_sources
    local lspconfig_to_mason = require("mason-lspconfig.mappings.server").lspconfig_to_package
    for source, _ in pairs(lsp_sources) do
        ensure_installed[#ensure_installed+1] = lspconfig_to_mason[source]
    end

    local null_ls_sources = require("BlakeJC94").null_ls_sources
    local null_ls_to_mason = require("mason-null-ls.mappings.source").getPackageFromNullLs
    for _, handlers in pairs(null_ls_sources) do
        for source, _ in pairs(handlers) do
            ensure_installed[#ensure_installed+1] = null_ls_to_mason(source)
        end
    end

    local dap_sources = require("BlakeJC94").dap_sources
    local dap_to_mason = require("mason-nvim-dap.mappings.source").nvim_dap_to_package
    for source, _ in pairs(dap_sources) do
        ensure_installed[#ensure_installed+1] = dap_to_mason[source]
    end

    require("mason-tool-installer").setup({ensure_installed = ensure_installed})

end

return M
