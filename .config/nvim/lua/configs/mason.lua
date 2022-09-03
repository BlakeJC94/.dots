return {
    requires = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-tool-installer").setup({
            ensure_installed = {
                -- lspconfig tools
                "pyright",
                "lua-language-server",
                "bash-language-server",
                "julia-lsp",
                -- null-ls tools
                "black",
                "pylint",
                "jq",
                "stylua",
                "luacheck",
                "shellcheck",
            },
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "MasonToolsUpdateComplete",
            callback = function()
                vim.schedule(print("mason-tool-installer has finished"))
            end,
        })
    end,
}
