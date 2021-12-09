telescope = require('telescope')
lsp = require('lspconfig')
cmp = require('cmp')

map = requires('my_utils').map
b_map = requires('my_utils').b_map
b_opt = requires('my_utils').b_opt

set_telescope_mappings = function()
    map('n', '<Leader>tf', '<CMD>Telescope find_files<CR>')
    map('n', '<Leader>tg', '<CMD>Telescope live_grep<CR>')
    map('n', '<Leader>tb', '<CMD>Telescope buffers<CR>')
    map('n', '<Leader>th', '<CMD>Telescope help_tags<CR>')
end

set_lsp_mappings = function()
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    b_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    b_map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    b_map('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    b_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    b_map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    b_map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>')

    b_map('n', '\\wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    b_map('n', '\\wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    b_map('n', '\\wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

    b_map('n', '\\d', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    b_map('n', '\\r', '<cmd>lua vim.lsp.buf.rename()<CR>')
    b_map('n', '\\f', '<cmd>lua vim.lsp.buf.code_action()<CR>')

    b_map('n', '<Leader>h', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    b_map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    b_map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

    b_map('n', '\\l', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
    b_map('n', '\\f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

    -- Enable completion triggered by <c-x><c-o>
    b_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')
end





M = {}

M.setup_telescope = function()
    local actions = require('telescope.actions')

    set_telescope_mappings()
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

M.setup_lsp = function()
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local lsp_on_attach = function(client)
        set_lsp_mappings()

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
-- function M.show_line_diagnostics()  -- old snippet from lspconfig config
--     local opts = {
--         focusable = false,
--         close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--     }
--     vim.lsp.diagnostic.show_line_diagnostics(opts)
-- end

M.setup_cmp = function()
    local tab_complete = require('utils').tab_complete
    local s_tab_complete = require('utils').s_tab_complete

    vim.opt.completeopt = 'menu,menuone,noselect'

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)  -- TODO replace with snippy
            end,
        },
        formatting = {format = require('lspkind').cmp_format({with_text = true, maxwidth = 50})},
        mapping = {
            ['<Up>'] = cmp.mapping.select_prev_item(),
            ['<Down>'] = cmp.mapping.select_next_item(),
            ['<S-Up>'] = cmp.mapping.scroll_docs(-4),
            ['<S-Down>'] = cmp.mapping.scroll_docs(4),
            ['<Left>'] = cmp.mapping.close(),
            ['<Right>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            ["<Tab>"] = cmp.mapping(tab_complete, {"i","s"}),
            ["<S-Tab>"] = cmp.mapping(s_tab_complete, {"i","s"}),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'path' },
            { name = 'latex_symbols' },
        }, {
            { name = 'buffer' }
        })
    })
end

return M
