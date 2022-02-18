M = {}

-- LSP configuration
M['neovim/nvim-lspconfig'] = {  -- LSP Engine configuration
    requires = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/nvim-lsp-installer",
        "RRethy/vim-illuminate",
        'nanotee/nvim-lsp-basics',
    },
    config = function()
        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local basics = require('lsp_basics')

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

        -- Specify actions to happen when lsp server starts on a buffer
        local on_attach = function(client)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Make basic LSP commands
            basics.make_lsp_commands(client, bufnr)
            basics.make_lsp_mappings(client, bufnr)

            -- Enable LSP-aware word highlighting
            -- require 'illuminate'.on_attach(client)

            -- TODO: Add LSP mappings here

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
                        reportGeneralTypeIssues = "none",
                        reportOptionalMemberAccess = "none",
                        reportOptionalSubscript = "none",
                        reportPrivateImportUsage = "none",
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

M['kosayoda/nvim-lightbulb'] = {
    config = function()
        require'nvim-lightbulb'.update_lightbulb {
            sign = {
                enabled = false,
                -- Priority of the gutter sign
                priority = 10,
            },
            float = {
                enabled = false,
                -- Text to show in the popup float
                text = "💡",
            },
            virtual_text = {
                enabled = true,
                -- Text to show at virtual text
                text = "💡",
                -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
                hl_mode = "replace",
            },
            status_text = {
                enabled = false,
                -- Text to provide when code actions are available
                text = "💡",
                -- Text to provide when no actions are available
                text_unavailable = ""
            }
        }
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    end
}

-- M["ray-x/lsp_signature.nvim"] = {
--     config = function()
--         require "lsp_signature".setup({})
--     end,
-- }

return M
