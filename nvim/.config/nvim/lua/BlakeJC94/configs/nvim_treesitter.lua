local M = {}

M.requires = {
    "andymass/vim-matchup", -- Extended motions for %
    "Glench/Vim-Jinja2-Syntax",
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
        matchup = { enable = true },
    })
end

return M
