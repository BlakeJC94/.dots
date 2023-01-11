local M = {}

M.additional_parsers = {
    "comment",
    "markdown",
    "markdown_inline",
    "regex",
    "graphql",
}

M.treesitter_textobjs_setup = function()
    return {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ao"] = "@class.outer",
                ["io"] = "@class.inner",
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
                ["]o"] = "@class.outer",
                ["]p"] = "@parameter.outer",
                ["]a"] = "@attribute.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]O"] = "@class.outer",
                ["]P"] = "@parameter.outer",
                ["]A"] = "@attribute.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[o"] = "@class.outer",
                ["[p"] = "@parameter.outer",
                ["[a"] = "@attribute.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[O"] = "@class.outer",
                ["[P"] = "@parameter.outer",
                ["[A"] = "@attribute.outer",
            },
        },
    }
end

M.treesitter_setup = function(ts_parsers)
    return {
        ensure_installed = ts_parsers,
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
        textobjects = require("BlakeJC94.configs.treesitter").treesitter_textobjs_setup(),
    }
end

M.treesitter_context_setup = function()
    return {
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
    }
end

M.config = function()
    local self = require("BlakeJC94.configs.treesitter")

    local ts_parsers = vim.list_extend(self.additional_parsers, require("BlakeJC94.globals").filetype_include)

    require("nvim-treesitter.configs").setup(self.treesitter_setup(ts_parsers))
    require("treesitter-context").setup(self.treesitter_context_setup())
    require("neogen").setup({ enabled = true })
end

return M
