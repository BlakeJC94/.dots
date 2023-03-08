local M = {}

M.requires = {
    "Glench/Vim-Jinja2-Syntax",  -- syntax highlighting by plugin until supported by TS
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
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "g=",
                node_incremental = "g+",
                scope_incremental = "g|",
                node_decremental = "g-",
            },
        },
    })
end

return M
