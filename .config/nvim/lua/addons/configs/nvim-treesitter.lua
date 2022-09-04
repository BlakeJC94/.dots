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
            "lua",
            "bash",
            "julia",
            "r",
            "regex",
        }

        require("nvim-treesitter.configs").setup({
            ensure_installed = default_parsers,
            sync_install = false,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
                -- disable = {"python", },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                    selection_modes = {
                        ["@parameter.outer"] = "v",
                        ["@function.outer"] = "V",
                        ["@class.outer"] = "V",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>s"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>S"] = "@parameter.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]c"] = "@class.outer",
                        ["]p"] = "@parameter.outer",
                        ["]a"] = "@attribute.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]C"] = "@class.outer",
                        ["]P"] = "@parameter.outer",
                        ["]A"] = "@attribute.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[c"] = "@class.outer",
                        ["[p"] = "@parameter.outer",
                        ["[a"] = "@attribute.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[C"] = "@class.outer",
                        ["[P"] = "@parameter.outer",
                        ["[A"] = "@attribute.outer",
                    },
                },
            },
            playground = {
                enable = true,
            },
        })

        require("spellsitter").setup()
        require("treesitter-context").setup({
            enable = true,
            throttle = true,
            max_lines = 0,
            patterns = {
                default = {
                    "class",
                    "function",
                    "method",
                },
            },
        })
        require("neogen").setup({ enabled = true })
    end,
}
