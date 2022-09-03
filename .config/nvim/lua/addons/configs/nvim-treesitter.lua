-- TODO setup textobjects properly

return {
    requires = {
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "lewis6991/spellsitter.nvim",
        "lewis6991/nvim-treesitter-context",
        "danymat/neogen",
    },
    run = ":TSUpdate",
    config = function()
        local default_parsers = {
            "comment",
            "markdown",
            "markdown_inline",
            "python",
            "bash",
            "lua",
            "regex",
            "julia",
            "r",
        }

        require('nvim-treesitter.configs').setup({
            ensure_installed = default_parsers,
            sync_install = false,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
                -- disable = {"python", },
            },
        })

        require("spellsitter").setup()
        require("treesitter-context").setup({
            enable = true,
            throttle = true,
            max_lines = 0,
            patterns = {
                default = {
                    'class',
                    'function',
                    'method',
                },
            },
        })
        require('neogen').setup({enabled = true})
    end
}

