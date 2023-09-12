local function config()
    local treesitter_configs = require("nvim-treesitter.configs")
    local ensure_installed = {
        "bash",
        "julia",
        "lua",
        "python",
        "r",
        "rust",
        "vim",
        "comment",
        "markdown",
        "markdown_inline",
        "regex",
        "graphql",
    }

    treesitter_configs.setup({
        ensure_installed = ensure_installed,
        sync_install = false,
        highlight = {
            enable = true,
            disable = function(lang, buf) -- Not a fan of handling on help docs
                if vim.api.nvim_buf_get_option(buf, "filetype") == "help" then
                    return true
                end
            end,
        },
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

config()
