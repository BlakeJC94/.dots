-- TODO refactor
return {
    requires = {
        'nvim-treesitter/playground',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'lewis6991/spellsitter.nvim',
        'lewis6991/nvim-treesitter-context',
        "danymat/neogen",
    },
    run = ':TSUpdate',
    config = function()
        local default_parsers = {
            "comment",
            "markdown",
            "python",
            "bash",
            "lua",
            "regex",
            "julia",
            "r",
            "rst",
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
            playground = {
                enable = true,
                disable = {},
                updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = 'o',
                    toggle_hl_groups = 'i',
                    toggle_injected_languages = 't',
                    toggle_anonymous_nodes = 'a',
                    toggle_language_display = 'I',
                    focus_language = 'f',
                    unfocus_language = 'F',
                    update = 'R',
                    goto_node = '<cr>',
                    show_help = '?',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                }
            },
        })

        -- TODO refacotr, check if loaded popen?
        require('spellsitter').setup()
        require('treesitter-context').setup({
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

