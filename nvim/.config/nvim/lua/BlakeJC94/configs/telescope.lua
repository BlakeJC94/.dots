local M = {}

M.config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- Use <C-q> to send results to qf
    local telescope_mappings = {
        n = { ["q"] = actions.close },
        i = { ["<esc>"] = actions.close },
    }

    local empty_borderchars = { " ", " ", " ", " ", " ", " ", " ", " " }

    telescope.setup({
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
            file_browser = {
                layout_config = {
                    width = 60,
                },
                previewer = false,
                hijack_netrw = true,
                path = "%:p:h",
                grouped = true,
                hidden = true,
                display_stat = false,
                file_ignore_patterns = { "%/.git/", "%/__pycache__/" },
            },
        },
        defaults = {
            borderchars = empty_borderchars,
            mappings = telescope_mappings,
            file_ignore_patterns = { "%.git/", "%/__pycache__/", "%/data/" },
        },
        pickers = {
            find_files = {
                hidden = true,
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
                }
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
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
end

return M
