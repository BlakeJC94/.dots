M = {}

M['nvim-telescope/telescope-fzf-native.nvim'] = {
    run = 'make'
}

-- Extensible Fuzzy finder
M['nvim-telescope/telescope.nvim'] = {
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-bibtex.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        local telescope_mappings = {
            n = {
                ["q"] = actions.close  -- Make q close telescope window
            },
            i = {
                ["<esc>"] = actions.close
            },
        }

        telescope.setup({
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            },
            defaults = {
                mappings = telescope_mappings,
            }
        })

        telescope.load_extension('fzf')
    end
}

return M
