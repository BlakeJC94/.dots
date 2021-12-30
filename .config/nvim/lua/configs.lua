M = {}

M.telescope = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
        defaults = {
            mappings = {
                n = {
                    ["q"] = actions.close  -- Make q close telescope window
                },
            },
        }
    })
end

M.lspconfig = function()
    local lspconfig = require('lspconfig')
    local cmp = require('cmp')

    -- Configure diagnostics
    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
    })
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Configure pqf to use the same signs
    require('pqf').setup({
        signs = {
            error = " ",
            warning = " ",
            info = " " ,
            hint = " ",
        }
    })

    -- Specify actions to happen when lsp server starts on a buffer
    local on_attach = function(client)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Print message if loaded successfully
        local msg = string.format("Language server %s started!", client.name)
        vim.api.nvim_echo({ { msg, "MoreMsg" } }, false, {})
    end

    -- Get additional capabilities supported by nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    -- Settings
    local settings = {}
    settings["pyright"] = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
                diagnosticSeverityOverrides = {
                    reportGeneralTypeIssues = "warning",
                },
            },
        },
    }

    -- Pass on_attach, capabilities, and settings to servers
    local servers = {
        "pyright",  -- npm i -g pyright
        "julials",  -- julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
        -- "bashls",
        -- "sumneko_lua",
    }
    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            handlers = handlers,
            flags = {
                debounce_text_changes = 150,
            },
            settings = settings[lsp],
        })
    end
end

M.treesitter = function()
    local treesitter_config = require('nvim-treesitter.configs')
    local treesitter = require('nvim-treesitter.configs')

    treesitter_config.setup({
        ensure_installed = {
            "comment",
            "markdown",
            "python",
            "bash",
            "lua",
            "regex",
            "julia",
            "r",
        },
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
        highlight = {
            enable = true
        },
        indent = {
            enable = false,
            -- disable = {"python", },
        },
        -- requiress 'nvim-treesitter/playground'
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

    require('spellsitter').setup({})

    require('treesitter-context').setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = {
                'class',
                'function',
                'method',
                -- 'for', -- These won't appear in the context
                -- 'while',
                -- 'if',
                -- 'switch',
                -- 'case',
            },
            -- Example for a specific filetype.
            -- If a pattern is missing, *open a PR* so everyone can benefit.
            --   rust = {
            --       'impl_item',
            --   },
        },
    })
end

M.cmp = function()
    local cmp = require('cmp')
    local snippy = require('snippy')
    local lspkind = require('lspkind')
    local autopairs = require('nvim-autopairs')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    vim.opt.completeopt = 'menu,menuone,noselect'

    cmp.setup({
        snippet = {
            expand = function(args)
                snippy.expand_snippet(args.body)
            end,
        },
        formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50})},
        mapping = {
            ['<Up>'] = cmp.mapping.select_prev_item(),
            ['<Down>'] = cmp.mapping.select_next_item(),
            ['<S-Up>'] = cmp.mapping.scroll_docs(-4),
            ['<S-Down>'] = cmp.mapping.scroll_docs(4),
            ['<Left>'] = cmp.mapping.close(),
            ['<Right>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif snippy.can_expand_or_advance() then
                    snippy.expand_or_advance()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif snippy.can_jump(-1) then
                    snippy.previous()
                else
                    fallback()
                end
            end, { "i", "s" }),
        },
        sources = cmp.config.sources({
            {name = 'nvim_lsp'},
            {name = 'snippy'},
            {name = 'path'},
            {name = 'latex_symbols'},
        }, {
            {name = 'buffer'}
        })
    })

    -- Set up autopairs
    autopairs.setup({})
    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
end

M.lir = function()
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

    lir.setup({
        show_hidden_files = false,
        devicons_enable = true,
        mappings = {
            ['l']     = actions.edit,
            ['<CR>']  = actions.edit,
            ['_']     = actions.split,
            ['|']     = actions.vsplit,
            ['T']     = actions.tabedit,
            ['h']     = actions.up,
            ['<BS>']  = actions.up,
            ['q']     = actions.quit,
            ['<ESC>'] = actions.quit,
            ['F']     = actions.mkdir,
            ['f']     = actions.newfile,
            ['R']     = actions.rename,
            ['@']     = actions.cd,
            ['P']     = actions.yank_path,
            ['yy']    = actions.yank_path,
            ['.']     = actions.toggle_show_hidden,
            ['D']     = actions.delete,
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

    vim.cmd[[command! Lir lua require('lir.float').toggle()]]
end

M.alpha = function()
    local alpha = require('alpha')
    local dashboard = require("alpha.themes.dashboard")
    local fortune = require("alpha.fortune")

    dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
    }
    dashboard.section.buttons.val = {
        dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
        dashboard.button("d", "  > Explore directory" , ":lua require'lir.float'.toggle()<CR>"),
        dashboard.button("e", "  > New file" , ":enew <CR>"),
        dashboard.button("r", "  > Recent"   , ":Telescope oldfiles<CR>"),
        dashboard.button("s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h<CR>"),
        dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
    }
    dashboard.section.footer.val = fortune()

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd("autocmd FileType alpha setlocal nofoldenable")
end

M.firenvim = function()
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

M.slime = function()
    vim.g.slime_target = "neovim"
    vim.g.slime_python_ipython = 1
end

M.indent_blankline = function()
    require("indent_blankline").setup({
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

M.quickscope = function()
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

M.harpoon = function()
    vim.cmd[[command! Harpoon lua require('harpoon.ui').toggle_quick_menu()]]
    vim.cmd[[command! HarpoonMark lua require('harpoon.mark').add_file()]]
    vim.cmd[[command! -nargs=1 HarpoonNav lua require('harpoon.ui').nav_file(<f-args>)]]
end

M.gitsigns = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup({
        signcolumn = false,
        numhl      = true,
        linehl     = false,
        keymaps    = {}, -- Kepmaps set in init.lua
        current_line_blame = true,
    })
end

M.toggleterm = function()
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

    local Terminal = require('toggleterm.terminal').Terminal

    local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
    })
    _G.lazygit_toggle = function()
        lazygit:toggle()
    end

    local nvtop = Terminal:new({
        cmd = "nvtop",
        direction = "float",
    })
    _G.nvtop_toggle = function()
        nvtop:toggle()
    end

    local bashtop = Terminal:new({
        cmd = "bashtop",
        direction = "float",
    })
    _G.bashtop_toggle = function()
        bashtop:toggle()
    end

    -- vim.cmd [[command Lazygit :call v:lua.lazygit_toggle()]]

    vim.cmd [[cabbrev term <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'ToggleTerm direction=horizontal' : 'term')<CR>]]
    vim.cmd [[cabbrev vterm <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'ToggleTerm direction=vertical' : 'vterm')<CR>]]
    -- cabbrev vterm <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vsplit term://bash' : 'vterm')<CR>
end

M.lualine = function()
    require'lualine'.setup {
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
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename',},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
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
    }
end

M.gruvbox = function()
    -- vim.opt.termguicolors           = true
    -- vim.opt.background              = 'dark'
    vim.g.gruvbox_italic            = 1
    vim.g.gruvbox_contrast_dark     = 'hard'
    vim.g.gruvbox_italicize_strings = 1
    vim.cmd [[colorscheme gruvbox]]
end

M.whichkey = function()
    require("which-key").setup({
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = false, -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = false, -- default bindings on <c-w>
                nav = false, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        popup_mappings = {
            scroll_down = '<c-d>', -- binding to scroll down inside the popup
            scroll_up = '<c-u>', -- binding to scroll up inside the popup
        },
        window = {
            border = "none", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specify a list manually
        triggers_blacklist = {
            -- list of mode / prefixes that should never be hooked by WhichKey
            -- this is mostly relevant for key maps that start with a native binding
            -- most people should not need to change this
            i = { "j", "k" },
            v = { "j", "k" },
        },
    })
end

M.zk = function()
    require("zk").setup({
        -- create user commands such as :ZkNew
        create_user_commands = true,
        lsp = {
            -- `config` is passed to `vim.lsp.start_client(config)`
            config = {
                cmd = { "zk", "lsp" },
                name = "zk",
                -- init_options = ...
                -- on_attach = ...
                -- etc, see `:h vim.lsp.start_client()`
            },
            -- automatically attach buffers in a zk notebook that match the given filetypes
            auto_attach = {
                enabled = true,
                filetypes = { "markdown" },
            },
        },
    })
    require("telescope").load_extension("zk")
end

return M
