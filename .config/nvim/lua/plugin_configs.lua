map = require('utils').map
b_map = require('utils').b_map
b_opt = require('utils').b_opt

M = {}

M.telescope = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    local telescope_mappings = {
        ['<Leader>tf'] = '<cmd>Telescope find_files<CR>',
        ['<Leader>tg'] = '<cmd>Telescope live_grep<CR>',
        ['<Leader>tb'] = '<cmd>Telescope buffers<CR>',
        ['<Leader>th'] = '<cmd>Telescope help_tags<CR>',
    }

    for lhs, rhs in pairs(telescope_mappings) do map('n', lhs, rhs) end

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
    local lsp = require('lspconfig')
    local lsp_installer = require("nvim-lsp-installer")
    local cmp = require('cmp')

    -- Install Lsp servers automatically
    -- local servers = {
    --     "pylsp"
    -- }

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local lsp_on_attach = function(client)
        -- Enable completion triggered by <c-x><c-o>
        b_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Set mappings
        lsp_mappings = {
            ['gd'] = '<cmd>lua vim.lsp.buf.definition()<CR>',
            ['gD'] = '<cmd>lua vim.lsp.buf.declaration()<CR>',
            ['gI'] = '<cmd>lua vim.lsp.buf.implementation()<CR>',
            ['gr'] = '<cmd>lua vim.lsp.buf.references()<CR>',
            ['gs'] = '<cmd>lua vim.lsp.buf.signature_help()<CR>',
            ['gh'] = '<cmd>lua vim.lsp.buf.hover()<CR>',
            ['\\wa'] = '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
            ['\\wr'] = '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
            ['\\wl'] = '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
            ['\\d'] = '<cmd>lua vim.lsp.buf.type_definition()<CR>',
            ['\\r'] = '<cmd>lua vim.lsp.buf.rename()<CR>',
            ['\\f'] = '<cmd>lua vim.lsp.buf.code_action()<CR>',
            ['<Leader>h'] = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
            ['[d'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
            [']d'] = '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
            ['\\l'] = '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
            ['\\f'] = '<cmd>lua vim.lsp.buf.formatting()<CR>',
        }
        for lhs, rhs in pairs(lsp_mappings) do b_map('n', lhs, rhs) end

        -- show line diagnostics under cursor after `updatetime`
        -- vim.cmd([[
        --     autocmd CursorHold <buffer> lua require('config.lspconfig').show_line_diagnostics()
        -- ]])
        --
        -- Print message if loaded successfully
        local msg = string.format("Language server %s started!", client.name)
        vim.api.nvim_echo({ { msg, "MoreMsg" } }, false, {})
    end

    -- Add additional capabilities supported by nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    -- TODO update this to simply use LspInstall
    --   Is it possible to apply common on_attach and capabilities for all servers?
    -- Python : `npm install pyright`
    lsp.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                    autoImportCompletions = false,
                },
            },
        },
    })
    -- Julia: `julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'`
    lsp.julials.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
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

M.zenmode = function()
    local zen_mode = require('zen-mode')

    zen_mode.setup({
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 120, -- width of the Zen window
                height = 1, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    signcolumn = "no", -- disable signcolumn
                    number = false, -- disable number column
                    relativenumber = false, -- disable relative numbers
                    -- cursorline = false, -- disable cursorline
                    cursorcolumn = false, -- disable cursor column
                    foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
            plugins = {
                -- disable some global vim options (vim.o...)
                -- comment the lines to not apply the options
                options = {
                    enabled = true,
                    ruler = false, -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                },
                twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = false }, -- disables git signs
                tmux = { enabled = false }, -- disables the tmux statusline
                -- this will change the font size on kitty when in zen mode
                -- to make this work, you need to set the following kitty options:
                -- - allow_remote_control socket-only
                -- - listen_on unix:/tmp/kitty
                kitty = {
                    enabled = false,
                    font = "+4", -- font size increment
                },
            },
            -- callback where you can add custom code when the Zen window opens
            on_open = function(win)
            end,
            -- callback where you can add custom code when the Zen window closes
            on_close = function()
            end,
        })
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

return M
