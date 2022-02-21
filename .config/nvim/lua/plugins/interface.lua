M = {}

-- Colorscheme
M["ellisonleao/gruvbox.nvim"] = {
    requires = {"rktjmp/lush.nvim"},
    config = function()
        vim.cmd [[
            augroup colorscheme_overrides
                autocmd!
                autocmd ColorScheme * hi Folded guibg='#282828'
                autocmd ColorScheme * hi ColorColumn guibg='#282828'
                autocmd ColorScheme * hi CursorLine guibg='#282828'
                autocmd ColorScheme * hi CursorLineNr guibg='#282828'
            augroup END
        ]]
        vim.g.gruvbox_italic            = 1
        vim.g.gruvbox_contrast_dark     = 'hard'
        vim.g.gruvbox_italicize_strings = 1
        vim.cmd [[colorscheme gruvbox]]
    end,
}

M["numToStr/FTerm.nvim"] = {
    config = function()
        require'FTerm'.setup({})
    end
}

-- <C-c><C-c> => Send code snippet to neovim terminal
M['jpalardy/vim-slime'] = {
    config = function()
        vim.g.slime_target = "neovim"
        vim.g.slime_python_ipython = 1
    end
}

-- -- Popup when pressing keys in normal mode TODO reevaluate, can this be replaced with telescope?
-- M["folke/which-key.nvim"] = {
--     config = function()
--         require("which-key").setup({
--             plugins = {
--                 marks = true,
--                 registers = true,
--                 spelling = {
--                     enabled = true,
--                     suggestions = 20,
--                 },
--                 presets = {
--                     operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
--                     motions = false, -- adds help for motions
--                     text_objects = false, -- help for text objects triggered after entering an operator
--                     windows = false, -- default bindings on <c-w>
--                     nav = false, -- misc bindings to work with windows
--                     z = false, -- bindings for folds, spelling and others prefixed with z
--                     g = false, -- bindings for prefixed with g
--                 },
--             },
--             popup_mappings = {
--                 scroll_down = '<a-d>', -- binding to scroll down inside the popup
--                 scroll_up = '<a-u>', -- binding to scroll up inside the popup
--             },
--             -- window = {
--             --     border = "none", -- none, single, double, shadow
--             --     position = "bottom", -- bottom, top
--             --     margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
--             --     padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
--             --     winblend = 0
--             -- },
--             -- layout = {
--             --     height = { min = 4, max = 16 }, -- min and max height of the columns
--             --     width = { min = 20, max = 50 }, -- min and max width of the columns
--             --     spacing = 3, -- spacing between columns
--             --     align = "left", -- align columns left, center or right
--             -- },
--             -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
--             -- show_help = true, -- show help message on the command line when the popup is visible
--             -- triggers = "auto", -- automatically setup triggers
--             triggers = {"<leader>"}, -- or specify a list manually
--         })
--     end
-- }

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

-- Firefox injection
M['glacambre/firenvim'] = {
    run = function() vim.fn['firenvim#install'](0) end,
    config = function()
        -- set specific filetypes for websites
        vim.cmd [[ au BufEnter github.com_*.txt set filetype=markdown ]]

        vim.g.firenvim_config = {
            globalSettings = {
                alt = 'all',
            },
            localSettings = {
                ['.*'] = {
                    cmdline= 'neovim',
                    content= 'text',
                    priority= 0,
                    selector= 'textarea',
                    takeover= 'never', -- disable until called with firefox hotkey <C-e>
                }
            },
        }
        vim.cmd [[
            if exists('g:started_by_firenvim')
                set wrap linebreak colorcolumn=0 breakindent
                "autocmd! TextChanged * ++nested write
                "autocmd! TextChangedI * ++nested write
                autocmd! InsertLeave,TextChanged * write
                echo 'TRACE'
                "hi Normal guibg='#1d2021'
            endif
        ]]
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

-- :Tetris
M['alec-gibson/nvim-tetris'] = {}

return M

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

