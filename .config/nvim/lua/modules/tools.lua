M = {}

-- Extensible Fuzzy finder
M['nvim-telescope/telescope.nvim'] = {
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-bibtex.nvim',
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
            defaults = {
                mappings = telescope_mappings,
            }
        })
    end
}

-- Better File explorer
M["tamago324/lir.nvim"] = {
    requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
    },
    config = function()
        local lir = require('lir')
        local devicons = require('nvim-web-devicons')

        -- Use custom folder icon
        devicons.set_icon({
            lir_folder_icon={
                icon="",
                name="LirFolderNode",
                color="#7ebae4",
            }
        })

        local actions = require('lir.actions')
        local mark_actions = require('lir.mark.actions')
        local clipboard_actions = require('lir.clipboard.actions')

        vim.cmd[[command! Lir lua require('lir.float').toggle()]]

        lir.setup({
            show_hidden_files = false,
            devicons_enable = true,
            mappings = {
                ['<CR>']  = actions.edit,
                ['_']     = actions.split,
                ['|']     = actions.vsplit,
                ['T']     = actions.tabedit,
                ['<BS>']  = actions.up,
                ['q']     = actions.quit,
                ['<ESC>'] = actions.quit,
                ['F']     = actions.mkdir,
                ['f']     = actions.newfile,
                ['R']     = actions.rename,
                ['@']     = actions.cd,
                ['yy']    = actions.yank_path,
                ['.']     = actions.toggle_show_hidden,
                ['dd']    = actions.delete,
                ['M']     = mark_actions.toggle_mark,
                ['Y']     = clipboard_actions.copy,
                ['C']     = clipboard_actions.cut,
                ['P']     = clipboard_actions.paste,
            },
            float = {
                winblend = 0,
            },
            hide_cursor = true,
        })

        -- use visual mode
        function _G.LirSettings()
            -- echo cwd
            vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
        end

        vim.cmd([[
            augroup lir-settings
                autocmd!
                autocmd Filetype lir :lua LirSettings()
                autocmd Filetype lir set nospell
            augroup END
        ]])

    end,
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
                "hi Normal guibg='#1d2021'
            endif
        ]]
    end
}

-- Better git interactions
-- TODO split reqs
M['lewis6991/gitsigns.nvim'] = {
    requires = {
        'nvim-lua/plenary.nvim',
        'tpope/vim-fugitive',
        'tpope/vim-rhubarb',
        'junegunn/gv.vim',
    },
    config = function()
        local gitsigns = require('gitsigns')
        gitsigns.setup({
            signcolumn = false,
            numhl      = true,
            linehl     = false,
            keymaps    = {}, -- Keymaps set in init.lua
            current_line_blame = true,
            preview_config = {
                border = 'none',
                style = 'minimal',
                relative = 'cursor',
            }
        })
    end
}

-- Better terminals
-- TODO split slime from reqs
-- TODO reconsider complexity of this wrapper
M["akinsho/toggleterm.nvim"] = {
    requires = {'jpalardy/vim-slime'},
    config = function()
        require('toggleterm').setup({
            -- size can be a number or function which is passed the current terminal
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            hide_numbers = true, -- hide the number column in toggleterm buffers
            shade_filetypes = false,
            shade_terminals = false,
            start_in_insert = true,
            persist_size = true,
            close_on_exit = true, -- close the terminal window when the process exits
        })

        -- vim slime configuration
        vim.g.slime_target = "neovim"
        vim.g.slime_python_ipython = 1
    end
}

-- :Neogen => Generate annotations for function
M["danymat/neogen"] = {
    config = function() require('neogen').setup { enabled = true } end,
    requires = "nvim-treesitter/nvim-treesitter"
}




return M
