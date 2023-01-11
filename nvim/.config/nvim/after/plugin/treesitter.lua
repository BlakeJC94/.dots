local additional_ts_parsers = {
    "comment",
    "markdown",
    "markdown_inline",
    "regex",
    "graphql",
}

local function treesitter_textobjs_config()
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

local function setup_treesitter()
    local ts_parsers = vim.list_extend(
        additional_ts_parsers,
        require("BlakeJC94.globals").filetype_include
    )

    require("nvim-treesitter.configs").setup({
        ensure_installed = ts_parsers,
        sync_install = false,
        highlight = {
            enable = true,
            disable = function(lang, buf)  -- Not a fan of handling on help docs
                if vim.api.nvim_buf_get_option(buf, "filetype") == "help" then
                    return true
                end
            end,
        },
        indent = { enable = true },
        playground = { enable = true },
        matchup = { enable = true },
        textobjects = treesitter_textobjs_config(),
    })

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
end

setup_treesitter()
