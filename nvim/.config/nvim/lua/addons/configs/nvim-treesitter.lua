_G._configs.treesitter_get_textobjs = function()
    return {
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
                ["]f"] = "@function.outer",
                ["]c"] = "@class.outer",
                ["]p"] = "@parameter.outer",
                ["]a"] = "@attribute.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@class.outer",
                ["]P"] = "@parameter.outer",
                ["]A"] = "@attribute.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
                ["[p"] = "@parameter.outer",
                ["[a"] = "@attribute.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@class.outer",
                ["[P"] = "@parameter.outer",
                ["[A"] = "@attribute.outer",
            },
        },
    }
end

return {
    requires = {
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "lewis6991/spellsitter.nvim",  -- TODO remove when merged into neovim
        "lewis6991/nvim-treesitter-context",  -- Pop-up for context
        "danymat/neogen",  -- Generate docstrings
        "andymass/vim-matchup",  -- Extended motions for %
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
            highlight = { enable = true },
            indent = { enable = true },
            playground = { enable = true },
            matchup = { enable = true },
            textobjects = _G._configs.treesitter_get_textobjs(),
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