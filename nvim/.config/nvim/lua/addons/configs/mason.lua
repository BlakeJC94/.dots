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
                "jq",
                "stylua",
                "luacheck",
                "shellcheck",
                -- "black",  -- TODO find a pyenv-compatible solution
                -- "pylint",  -- TODO find a pyenv-compatible solution
            },
        })
    end,
}
