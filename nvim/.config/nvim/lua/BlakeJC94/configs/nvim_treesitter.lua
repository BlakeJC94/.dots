local M = {}

M.requires = {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "andymass/vim-matchup", -- Extended motions for %
    "phelipetls/jsonpath.nvim", -- JSON paths require"jsonpath".get()
}

M.run = ":TSUpdate"

function M.config()
    local treesitter_configs = require("nvim-treesitter.configs")
    local filetype_include = require("BlakeJC94").filetype_include
    local additional_parsers = {
        "comment",
        "markdown",
        "markdown_inline",
        "regex",
        "graphql",
    }

    treesitter_configs.setup({
        ensure_installed = vim.list_extend(filetype_include, additional_parsers),
        sync_install = false,
        highlight = {
            enable = true,
            disable = function(lang, buf) -- Not a fan of handling on help docs
                if vim.api.nvim_buf_get_option(buf, "filetype") == "help" then
                    return true
                end
            end,
        },
        indent = { enable = true },
        playground = { enable = true },
        matchup = { enable = true },
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    ["aF"] = "@function.outer",
                    ["iF"] = "@function.inner",
                    ["aC"] = "@class.outer",
                    ["iC"] = "@class.inner",
                    ["aI"] = "@parameter.outer",
                    ["iI"] = "@parameter.inner",
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
                    ["]F"] = "@function.outer",
                    ["]C"] = "@class.outer",
                    ["]I"] = "@parameter.outer",
                },
                goto_previous_start = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@class.outer",
                    ["[I"] = "@parameter.outer",
                },
            },
        },
    })
end

return M
