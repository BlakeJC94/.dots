map = require('utils').map
b_map = require('utils').b_map
b_opt = require('utils').b_opt

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
        virtual_text = true,
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

    -- Specify actions to happen when lsp server starts on a buffer
    local on_attach = function(client)
        -- Enable completion triggered by <c-x><c-o>
        b_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Set mappings
        lsp_mappings = {
            ['gd']   = '<cmd>lua vim.lsp.buf.definition()<CR>',
            ['gD']   = '<cmd>lua vim.lsp.buf.declaration()<CR>',
            ['gI']   = '<cmd>lua vim.lsp.buf.implementation()<CR>',
            ['gr']   = '<cmd>lua vim.lsp.buf.references()<CR>',
            ['gs']   = '<cmd>lua vim.lsp.buf.signature_help()<CR>',
            ['gh']   = '<cmd>lua vim.lsp.buf.hover()<CR>',
            ['\\wa'] = '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
            ['\\wr'] = '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
            ['\\wl'] = '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
            ['\\d']  = '<cmd>lua vim.lsp.buf.type_definition()<CR>',
            ['\\r']  = '<cmd>lua vim.lsp.buf.rename()<CR>',
            ['\\f']  = '<cmd>lua vim.lsp.buf.code_action()<CR>',
            ['<Leader>e']  = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
            ['[e']   = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
            [']e']   = '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
            ['\\l']  = '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
            ['\\f']  = '<cmd>lua vim.lsp.buf.formatting()<CR>',
        }
        for lhs, rhs in pairs(lsp_mappings) do b_map('n', lhs, rhs) end

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
        }
    })

    require('spellsitter').setup {}
end

M.cmp = function()
    local cmp = require('cmp')
    local snippy = require('snippy')
    local lspkind = require('lspkind')

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        local content = vim.api.nvim_buf_get_lines(0, line - 1, line, true)
        return col ~= 0 and content[1]:sub(col, col):match("%s") == nil
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
            end, {"i","s"}),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif snippy.can_jump(-1) then
                    snippy.previous()
                else
                    fallback()
                end
            end, {"i","s"}),
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
            ['.']     = actions.toggle_show_hidden,
            ['D']     = actions.delete,
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
        -- b_map('x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>')

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
        dashboard.button("d", "  > Explore directory" , ":lua require'lir.float'.toggle()<CR>"),
        dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
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
    harpoon_mappings = {  -- TODO update mappings
        ['<leader>1'] = '<cmd>lua require("harpoon.ui").nav_file(1)<cr>',
        ['<leader>2'] = '<cmd>lua require("harpoon.ui").nav_file(2)<cr>',
        ['<leader>3'] = '<cmd>lua require("harpoon.ui").nav_file(3)<cr>',
        ['<leader>4'] = '<cmd>lua require("harpoon.ui").nav_file(4)<cr>',
        ['<leader>5'] = '<cmd>lua require("harpoon.ui").nav_file(5)<cr>',
        ['<leader>6'] = '<cmd>lua require("harpoon.ui").nav_file(6)<cr>',
    }
    for lhs, rhs in pairs(harpoon_mappings) do map('n', lhs, rhs) end
end

M.gitsigns = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup({
        signcolumn = false,
        numhl      = true,
        linehl     = false,
        keymaps = {
            -- Default keymap options
            noremap = true,

            ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
            ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

            ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
            ['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
            ['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
            ['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
            ['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
            ['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
            ['n <leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
            ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
            ['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
            ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

            -- Text objects
            ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
            ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
        },
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

return M
