M = {}

-- Better statusline
M['nvim-lualine/lualine.nvim'] = {
    requires = {
        'kyazdani42/nvim-web-devicons',
        'arkav/lualine-lsp-progress',
    },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = 'gruvbox',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {},
                always_divide_middle = true,
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff'},
                lualine_c = {'filename', 'lsp_progress'},
                lualine_x = {'filetype'},
                lualine_y = {'location', 'progress'},
                lualine_z = {'tabs'},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = {}
        })
    end
}

-- Better quickfix list format
M['https://gitlab.com/yorickpeterse/nvim-pqf'] = {
    config = function()
        local pqf = require('pqf')
        pqf.setup({
            signs = {
                error = " ",
                warning = " ",
                info = " " ,
                hint = " ",
            }
        })
    end
}

-- Indent guides
M["lukas-reineke/indent-blankline.nvim"] = {
    requires = {"lukas-reineke/virt-column.nvim"},
    config = function()
        require("indent_blankline").setup({
            show_current_context = true,
            show_current_context_start = false,
            filetype_exclude = {
                "help",
                "alpha",
                "lir",
                "packer",
                "man",
            },
            buftype_exclude = {"terminal",},
        })
        vim.cmd("highlight IndentBlanklineContextChar guifg=#a89984 gui=nocombine")
    end
}

-- Popup when pressing keys in normal mode
M["folke/which-key.nvim"] = {
    config = function()
        require("which-key").setup({
            plugins = {
                marks = true,
                registers = true,
                spelling = {
                    enabled = true,
                    suggestions = 20,
                },
                presets = {
                    operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = false, -- adds help for motions
                    text_objects = false, -- help for text objects triggered after entering an operator
                    windows = false, -- default bindings on <c-w>
                    nav = false, -- misc bindings to work with windows
                    z = false, -- bindings for folds, spelling and others prefixed with z
                    g = false, -- bindings for prefixed with g
                },
            },
            popup_mappings = {
                scroll_down = '<a-d>', -- binding to scroll down inside the popup
                scroll_up = '<a-u>', -- binding to scroll up inside the popup
            },
            -- window = {
            --     border = "none", -- none, single, double, shadow
            --     position = "bottom", -- bottom, top
            --     margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            --     padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            --     winblend = 0
            -- },
            -- layout = {
            --     height = { min = 4, max = 16 }, -- min and max height of the columns
            --     width = { min = 20, max = 50 }, -- min and max width of the columns
            --     spacing = 3, -- spacing between columns
            --     align = "left", -- align columns left, center or right
            -- },
            -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
            -- show_help = true, -- show help message on the command line when the popup is visible
            -- triggers = "auto", -- automatically setup triggers
            triggers = {"<leader>"}, -- or specify a list manually
        })
    end
}

-- :ZenMode => Toggle Focus Mode (:Twilight => Toggle Focus highlights)
M["folke/zen-mode.nvim"] = {
    requires = {"folke/twilight.nvim"},
    config = function() require("zen-mode").setup({
        window = {
            options = {
                number = false,
                relativenumber = false,
            }
        }
    }) end
}


-- :Tetris
M['alec-gibson/nvim-tetris'] = {}

-- TODO implement vim tips fortunes?
-- -- Landing page
-- M['goolord/alpha-nvim'] = {
--     config = function()
--         local alpha = require('alpha')
--         local dashboard = require("alpha.themes.dashboard")

--         dashboard.section.header.val = {
--             "                                                     ",
--             "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--             "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--             "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--             "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--             "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--             "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--             "                                                     ",
--         }
--         dashboard.section.buttons.val = {
--             -- dashboard.button("", "  > Notes", ":Notes<CR>"),
--             dashboard.button("d", "  > Explore directory", ":edit %:p:h<CR>"),
--             dashboard.button("n", "  > New file", ":enew <CR>"),
--             dashboard.button("o", "  > Search old files", ":Telescope oldfiles<CR>"),
--             dashboard.button(";", "  > Settings", ":Settings<CR>"),
--             dashboard.button("q", "  > Quit NVIM", ":q<CR>"),
--         }
--         local handle = io.popen('fortune')
--         local fortune = handle:read("*a")
--         handle:close()
--         dashboard.section.footer.val = fortune

--         -- Send config to alpha
--         alpha.setup(dashboard.opts)

--         -- Disable folding on alpha buffer
--         vim.cmd("autocmd FileType alpha setlocal nofoldenable")
--     end
--  }

return M
