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
                local pyenv_root = os.getenv("PYENV_ROOT")
                if pyenv_root then
                    local fs = require("mason-core.fs")

                    local mason_pylint = require("mason-core.path").bin_prefix("pylint")
                    local pyenv_pylint = pyenv_root .. "/shims/pylint"

                    -- Backup the mason bin
                    fs.sync.rename(mason_pylint, require("mason-core.path").bin_prefix("pylint.mason"))

                    -- Link mason bin to pyenv bin
                    fs.sync.symlink(pyenv_pylint, mason_pylint)

                    -- TODO check if pylint works in pyenv venv, install if not
                end
            end,
        })
    end,
}
