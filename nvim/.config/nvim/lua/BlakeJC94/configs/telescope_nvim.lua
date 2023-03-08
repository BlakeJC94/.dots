local M = {}

M.requires = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
}

function M.config()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- Use <C-q> to send results to qf
    local telescope_mappings = {
        n = { ["q"] = actions.close },
        i = { ["<esc>"] = actions.close },
    }

    local empty_borderchars = { " ", " ", " ", " ", " ", " ", " ", " " }

    telescope.setup({
        defaults = {
            theme = "ivy",
            borderchars = empty_borderchars,
            mappings = telescope_mappings,
            file_ignore_patterns = { "%.git/", "%/__pycache__/", "%/data/" },
        },
        pickers = {
            find_files = {
                hidden = true,
                theme = "ivy",
                borderchars = empty_borderchars,
            },
            git_status = {
                git_icons = {
                    added = "",
                    changed = "",
                    copied = "",
                    deleted = "",
                    renamed = "",
                    unmerged = "",
                    untracked = "",
                },
            },
            registers = {
                theme = "ivy",
                borderchars = empty_borderchars,
            },
            spell_suggest = {
                theme = "ivy",
                borderchars = empty_borderchars,
            },
        },
        extensions = {
            ["fzf"] = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    })

    telescope.load_extension("fzf")
end

return M
