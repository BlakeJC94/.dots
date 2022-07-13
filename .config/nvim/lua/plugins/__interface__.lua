-- INTERFACE.LUA : Changes and enhancements to UX and non-editor functions
M = {}

-- Colorscheme
M["ellisonleao/gruvbox.nvim"] = {
    requires = {"rktjmp/lush.nvim"},
    config = function()
        vim.o.background = "dark"
        require("gruvbox").setup({
            undercurl = true,
            underline = true,
            bold = true,
            italic = true, -- will make italic comments and special strings
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            contrast = "hard", -- can be "hard" or "soft"
            overrides = {
                Folded = {bg = "#282828"},
                ColorColumn = {bg = "#282828"},
                CursorLine = {bg = "#282828"},
                CursorLineNr = {bg = "#282828"},
                IndentBlanklineContextChar = {fg = "#a89984"},
                Search = {fg = "#fabd2f", bg = "#282828"},
                CurSearch = {bg = "#fabd2f", fg = "#282828"},
                IncSearch = {fg = "#fabd2f", bg = "#282828"},
            },
        })
        vim.cmd("colorscheme gruvbox")
    end,
}

-- M["numToStr/FTerm.nvim"] = {
--     config = function() require('FTerm').setup({}) end
-- }

-- <C-c><C-c> => Send code snippet to terminal
M['jpalardy/vim-slime'] = {
    config = function()
        vim.g.slime_target = "neovim"
        vim.g.slime_python_ipython = 1
        -- vim.g.slime_paste_file = vim.fn.tempname()
        -- vim.g.slime_default_config = {socket_name = "default", target_pane = "{last}"}
    end
}

-- Toggle undotree
-- M['mbbill/undotree'] = {}

--
M['folke/twilight.nvim'] = {
    config = function() require("twilight").setup({
        dimming = {
            alpha = 1.0, -- amount of dimming
            -- we try to get the foreground from the highlight groups or fallback color
            color = { "Normal", "#ffffff" },
            inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
    }) end
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

-- Firefox injection
-- M['glacambre/firenvim'] = {
--     run = function() vim.fn['firenvim#install'](0) end,
--     config = function()
--         -- set specific filetypes for websites
--         vim.cmd [[ au BufEnter github.com_*.txt set filetype=markdown ]]

--         vim.g.firenvim_config = {
--             globalSettings = {
--                 alt = 'all',
--             },
--             localSettings = {
--                 ['.*'] = {
--                     cmdline= 'neovim',
--                     content= 'text',
--                     priority= 0,
--                     selector= 'textarea',
--                     takeover= 'never', -- disable until called with firefox hotkey <C-e>
--                 }
--             },
--         }
--         vim.cmd [[
--             if exists('g:started_by_firenvim')
--                 set wrap linebreak colorcolumn=0 breakindent
--                 "autocmd! TextChanged * ++nested write
--                 "autocmd! TextChangedI * ++nested write
--                 autocmd! InsertLeave,TextChanged * write
--                 echo 'TRACE'
--                 "hi Normal guibg='#1d2021'
--             endif
--         ]]
--     end
-- }

M['5long/pytest-vim-compiler'] = {}

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

-- Highlight lines during selection in command mode
-- M["winston0410/range-highlight.nvim"] = {
--     config = function() require('range-highlight').setup({}) end,
--     requires = {'winston0410/cmd-parser.nvim'}
-- }

-- Peek buffer lines during selection in command mode
M['nacro90/numb.nvim'] = {
    config = function() require('numb').setup() end,
}

-- Jump to last place when opening a file
M['ethanholz/nvim-lastplace'] = {
    config = function() require('nvim-lastplace').setup{} end,
}

-- Stabilise split creation
M["luukvbaal/stabilize.nvim"] = {
    config = function() require("stabilize").setup() end
}

-- Ping cursor location after jump
M['danilamihailov/beacon.nvim'] = {}

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
    end
}

-- Better f/t targets
M["unblevable/quick-scope"] = {
    config = function()
        vim.g.qs_max_chars=800
        vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
        vim.cmd [[
            function! QSColors()
                highlight QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold
                highlight QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold
            endfunction
            call QSColors()
            augroup qs_colors
                autocmd!
                autocmd ColorScheme * call QSColors()
            augroup END
        ]]
    end
}

-- Colors Hex codes
M['norcalli/nvim-colorizer.lua'] = {
    config = function() require("colorizer").setup({'*'}, {names=false}) end
}

-- Subtle highlighting of instances of word under cursor
M["RRethy/vim-illuminate"] = {
    config = function()
        vim.g.Illuminate_ftblacklist = {'lir'}
    end
}

-- Dim inactive splits
-- M['sunjon/Shade.nvim'] = {
--     config = function() require'shade'.setup() end,
-- }

-- Highlighting for kitty config
M["fladson/vim-kitty"] = {}

M['numToStr/FTerm.nvim'] = {
    config=function()
        -- require("FTerm").setup()
    end
}

M['aserowy/tmux.nvim'] = {
    config = function()
        require("tmux").setup({
            copy_sync = {
                enable = false,
            },
            navigation = {
                enable_default_keybindings = false,
            },
            resize = {
                enable_default_keybindings = false,
                resize_step_x = 8,
                resize_step_y = 8,
            }
        })

        local map = vim.keymap.set
        -- Set mappings to override `wincmd` commands
        map('', '<C-z><Left>',  function() return require("tmux").move_left()   end)
        map('', '<C-z>h',       function() return require("tmux").move_left()   end)
        map('', '<C-z><Down>',  function() return require("tmux").move_bottom() end)
        map('', '<C-z>j',       function() return require("tmux").move_bottom() end)
        map('', '<C-z><Up>',    function() return require("tmux").move_top()    end)
        map('', '<C-z>k',       function() return require("tmux").move_top()    end)
        map('', '<C-z><Right>', function() return require("tmux").move_right()  end)
        map('', '<C-z>l',       function() return require("tmux").move_right()  end)

        -- Set mappings for resizing splits
        map('', '<S-Left>',  function() return require("tmux").resize_left(8)   end)
        map('', '<S-Down>',  function() return require("tmux").resize_bottom(4) end)
        map('', '<S-Up>',    function() return require("tmux").resize_top(4)    end)
        map('', '<S-Right>', function() return require("tmux").resize_right(8)  end)

        -- Link up `wincmd` <S-Arrow> actions
        map('', '<Leader><S-Left>',  '<C-w>H')
        map('', '<Leader><S-Down>',  '<C-w>J')
        map('', '<Leader><S-Up>',    '<C-w>K')
        map('', '<Leader><S-Right>', '<C-w>L')
        map('', '<Leader>H', '<C-w>H')
        map('', '<Leader>J', '<C-w>J')
        map('', '<Leader>K', '<C-w>K')
        map('', '<Leader>L', '<C-w>L')

    end
}

return M
