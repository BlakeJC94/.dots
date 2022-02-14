M = {}

-- LSP configuration
-- TODO separate pqf from this
M['neovim/nvim-lspconfig'] = {  -- LSP Engine configuration
    requires = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        'https://gitlab.com/yorickpeterse/nvim-pqf',
        "williamboman/nvim-lsp-installer",
    },
    config = function()
        local lspconfig = require('lspconfig')
        local cmp = require('cmp')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local pqf = require('pqf')

        -- Configure diagnostics
        vim.diagnostic.config({
            virtual_text = false,
            signs = false,
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
        pqf.setup({
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
            -- local msg = string.format("Language server %s started!", client.name)
            -- vim.api.nvim_echo({ { msg, "MoreMsg" } }, false, {})
        end

        -- Get additional capabilities supported by nvim-cmp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

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
}

-- Loading status for LSP
M['j-hui/fidget.nvim'] = {
    config = function() require('fidget').setup({}) end,
}

-- Extra sources for LSP
M['jose-elias-alvarez/null-ls.nvim'] = {
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.yapf,
            },
        })
    end,
}

-- Treesitter configuration
M['nvim-treesitter/nvim-treesitter'] = {
    requires = {
        'nvim-treesitter/playground',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'romgrk/nvim-treesitter-context',
        'lewis6991/spellsitter.nvim',
        -- "SmiteshP/nvim-gps",
    },
    run = ':TSUpdate',
    config = function()
        local treesitter_config = require('nvim-treesitter.configs')
        local context = require('treesitter-context')
        -- local gps = require("nvim-gps")
        local spellsitter = require('spellsitter')

        local default_parsers = {
            "comment",
            "markdown",
            "python",
            "bash",
            "lua",
            "regex",
            "julia",
            "r",
            "rst",
        }

        treesitter_config.setup({
            ensure_installed = default_parsers,
            sync_install = false,
            highlight = {
                enable = true,
                -- additional_vim_regex_highlighting = true,
            },
            indent = {
                enable = true,
                -- disable = {"python", },
            },
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

        context.setup({
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

        spellsitter.setup()
        -- gps.setup()
    end,
}

-- Fix for Python auto-indent in Treesitter
M['Vimjas/vim-python-pep8-indent'] = {}

-- Language pack to use if TS not present
M['sheerun/vim-polyglot'] = {}

return M
